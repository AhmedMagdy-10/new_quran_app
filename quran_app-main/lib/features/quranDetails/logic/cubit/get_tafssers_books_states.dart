import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/quranDetails/logic/models/reciter_model.dart';

abstract class QuranPagePlayerState {}

class InitialGetTafssersBookState extends QuranPagePlayerState {}

class LoadingState extends QuranPagePlayerState {}

class QuranPagePlayerPlaying extends QuranPagePlayerState {
  final AudioPlayer player;
  final Stream<Duration?> audioPlayerStream;
  final int suraNumber;
  final QuranPageReciter reciter;
  final List durations;

  QuranPagePlayerPlaying({
    required this.player,
    required this.audioPlayerStream,
    required this.suraNumber,
    required this.reciter,
    required this.durations,
  });
}

class QuranPagePlayerStoping extends QuranPagePlayerState {}

class QuranPagePlayerStarting extends QuranPagePlayerState {}

class QuranPagePlayerkilling extends QuranPagePlayerState {}

class QuranPagePlayerDispose extends QuranPagePlayerState {}

class IsDownloadingState extends QuranPagePlayerState {}

class QuranPagePlayerDownloading extends QuranPagePlayerState {
  final bool isDownloading;

  QuranPagePlayerDownloading({required this.isDownloading});
}

class QuranPagePlayerDownloaded extends QuranPagePlayerState {
  final String fullSuraFilePath;

  QuranPagePlayerDownloaded({required this.fullSuraFilePath});
}

class QuranPagePlayerDownloadError extends QuranPagePlayerState {
  final String error;

  QuranPagePlayerDownloadError({required this.error});
}
