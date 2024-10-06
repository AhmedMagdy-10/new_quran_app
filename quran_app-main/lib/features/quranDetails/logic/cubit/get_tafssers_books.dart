import 'dart:convert';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:dio/dio.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/core/helper/show_toast_state.dart';
import 'package:quran_app/features/quranDetails/logic/cubit/get_tafssers_books_states.dart';
import 'package:quran_app/features/quranDetails/logic/models/reciter_model.dart';

class GetTafssersBookCubit extends Cubit<QuranPagePlayerState> {
  GetTafssersBookCubit() : super(InitialGetTafssersBookState());

  bool isDownloading = false;

  AudioPlayer? audioPlayer;

  // Method to download and cache sura audio

  Future<void> downloadAndCacheSuraAudio(String suraName, int totalVerses,
      int suraNumber, String reciterIdentifier) async {
    emit(QuranPagePlayerDownloading(isDownloading: true));

    final dio = Dio();
    final appDir = await getTemporaryDirectory();
    // Sanitize the Sura name
    final sanitizedSuraName = suraName.replaceAll(RegExp(r'\s+'), '_');
    final fullSuraFilePath =
        "${appDir.path}/$reciterIdentifier-$sanitizedSuraName.mp3";

    print("Full sura file path: $fullSuraFilePath");

    // Check if the full Sura file is already cached
    if (File(fullSuraFilePath).existsSync()) {
      showToast(text: "تجهيز الصوت", state: ToastStates.success);
      emit(QuranPagePlayerDownloaded(fullSuraFilePath: fullSuraFilePath));
      return;
    }

    showToast(
        text: "يتم تحميل الصوت , من فضلك انتظر", state: ToastStates.success);

    final List<String> audioFilePaths = [];
    List<Map<String, dynamic>> verseNumberAndDuration = [];
    double startDuration = 0.0;

    try {
      for (int verse = 1; verse <= totalVerses; verse++) {
        // Prepare the file name for each verse

        final fileName = "$reciterIdentifier-$sanitizedSuraName-$verse.mp3";
        final filePath = '${appDir.path}/$fileName';

        // Check if the file for the current verse exists, if not, download it
        if (!File(filePath).existsSync()) {
          final audioUrl =
              getAudioURLByVerse(suraNumber, verse, reciterIdentifier);

          final encodedUrl = Uri.encodeFull(audioUrl);

          print("Downloading $encodedUrl to $filePath");
          await dio.download(encodedUrl, filePath);
          print("Downloaded verse $verse to: $filePath");

          // Retrieve metadata
          final metadata = await MetadataRetriever.fromFile(File(filePath));
          if (metadata.trackDuration == null) {
            print("Metadata retrieval failed for verse $verse");
            continue;
          }

          verseNumberAndDuration.add({
            "verseNumber": verse,
            "startDuration": startDuration,
            "endDuration": startDuration + metadata.trackDuration!
          });
          startDuration += metadata.trackDuration!;
        } else {
          print("File for verse $verse already exists: $filePath");
        }

        audioFilePaths.add(filePath);
      }

      // Store verse durations
      String jsonString = json.encode(verseNumberAndDuration);
      updateHiveSavedData(
          "$reciterIdentifier-$sanitizedSuraName-durations", jsonString);

      // Concatenate audio files
      if (audioFilePaths.isNotEmpty) {
        String inputOptions =
            audioFilePaths.map((filePath) => '-i "$filePath"').join(" ");
        String cmd =
            "$inputOptions -filter_complex 'concat=n=${audioFilePaths.length}:v=0:a=1[a]' -map '[a]' -codec:a libmp3lame -qscale:a 2 $fullSuraFilePath";

        print("Executing FFmpeg command: $cmd");
        final dynamic resultCode = await FFmpegKit.execute(cmd);

        if (resultCode == 0) {
          showToast(text: "تم التحميل بنجاح", state: ToastStates.success);
          emit(QuranPagePlayerDownloaded(fullSuraFilePath: fullSuraFilePath));
        } else {
          // showToast(
          //     text: "Error combining audio files", state: ToastStates.error);
          emit(QuranPagePlayerDownloadError(
              error: "FFmpeg error code: $resultCode"));
        }
      } else {
        showToast(
            text: "No audio files found to combine", state: ToastStates.error);
        emit(QuranPagePlayerDownloadError(error: "No audio files found"));
      }
    } catch (e) {
      showToast(text: "Error downloading audio", state: ToastStates.error);
      emit(QuranPagePlayerDownloadError(error: e.toString()));
    } finally {
      emit(QuranPagePlayerDownloading(isDownloading: false));
    }
  }

  List<QuranPageReciter> reciters = [];
  addReciters() {
    getReciters().forEach((element) {
      reciters.add(QuranPageReciter(
        identifier: element["identifier"],
        language: element["language"],
        name: element["name"],
        englishName: element["englishName"],
        format: element["format"],
        type: element["type"],
        direction: element["direction"],
      ));
    });
  }

  Future<void> playFromVerse(
    int verse,
    String reciterIdentifier,
    int surahNumber,
    String suraName,
  ) async {
    try {
      // Stop and dispose of any existing audio player
      await stopAnyPlayingAudio();
      emit(QuranPagePlayerStarting());

      audioPlayer = AudioPlayer();

      // Sanitize surah name for consistency
      String sanitizedSuraName = suraName.replaceAll(" ", "_");

      // Fetch stored verse duration data from Hive using the sanitized surah name
      String? storedJsonString =
          getHiveSavedData("$reciterIdentifier-$sanitizedSuraName-durations");

      if (storedJsonString == null) {
        print("No duration data found for surah: $sanitizedSuraName");
        showToast(text: "No duration data found", state: ToastStates.error);
        return;
      }

      // Decode the JSON to get verse durations
      List<dynamic> decodedList = json.decode(storedJsonString);
      List durations = List.from(decodedList);

      // Find the matching verse duration
      final matchingDuration = durations.firstWhere(
        (element) => element["verseNumber"] == verse,
        orElse: () => null,
      );

      if (matchingDuration == null) {
        print("No duration found for verse $verse");
        showToast(text: "No duration data found", state: ToastStates.error);
        return;
      }

      double startDuration = matchingDuration["startDuration"];
      print("Found duration for verse $verse: start at $startDuration");

      // Get the file path for the surah audio
      final appDir = await getTemporaryDirectory();
      final fullSuraFilePath =
          "${appDir.path}/$reciterIdentifier-$sanitizedSuraName.mp3";

      // Check if the audio file exists at the given path
      if (!File(fullSuraFilePath).existsSync()) {
        print("Audio file not found at $fullSuraFilePath");
        showToast(text: "Audio file not found", state: ToastStates.error);
        return;
      }

      // Configure the audio session
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Set the audio source and handle any loading errors
      try {
        await audioPlayer!.setAudioSource(AudioSource.file(fullSuraFilePath));
      } catch (e) {
        print("Error loading audio source: $e");
        return;
      }

      // Seek to the correct position for the verse
      print("Seeking to $startDuration milliseconds for verse $verse");
      await audioPlayer!.seek(Duration(milliseconds: startDuration.toInt()));

      // Start playing the audio
      await audioPlayer!.play();

      print("Audio started playing successfully.");
      showToast(text: "بدء الاستماع", state: ToastStates.success);

      // Emit a playing state with player details
      emit(QuranPagePlayerPlaying(
        player: audioPlayer!,
        audioPlayerStream: audioPlayer!.positionStream,
        suraNumber: surahNumber,
        reciter: reciters
            .firstWhere((element) => element.identifier == reciterIdentifier),
        durations: durations,
      ));
    } catch (e) {
      print("Error in playFromVerse: $e");
      // showToast(
      //     text: "An error occurred during playback", state: ToastStates.error);
    }
  }

  // // Method to stop playing audio
  // Future<void> stopPlaying() async {
  //   if (audioPlayer != null) {
  //     print("Stopping the audio player.");
  //     await audioPlayer!.stop();
  //     await audioPlayer!.dispose();
  //     audioPlayer = null; // Reset the audio player
  //   }
  //   emit(QuranPagePlayerStoping());
  // }

  // Method to dispose of the audio player completely
  Future<void> disposePlayer() async {
    if (audioPlayer != null) {
      print("Disposing the audio player.");
      await audioPlayer!.dispose();
      audioPlayer = null;
    }
    emit(QuranPagePlayerDispose());
  }

  // Method to kill the audio player (force dispose without stop)
  void killPlayer() {
    if (audioPlayer != null) {
      print("Killing the audio player.");
      audioPlayer!.dispose();
      audioPlayer = null;
    }
    emit(QuranPagePlayerkilling());
  }

  Future<bool> isAnyAudioPlaying() async {
    if (audioPlayer != null) {
      return audioPlayer!.playing;
    } else {
      return false;
    }
  }

  // Stop the currently playing audio if any
  Future<void> stopAnyPlayingAudio() async {
    if (await isAnyAudioPlaying()) {
      await audioPlayer!.stop(); // Stop the audio
      emit(QuranPagePlayerStoping()); // Emit the appropriate state
    }
  }
}
