import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/core/helper/remove_html_tags.dart';
import 'package:quran_app/features/quranDetails/logic/translation/translationdata.dart';
import 'package:share_plus/share_plus.dart';
import 'package:quran_app/features/quranDetails/logic/translation/get_translation_data.dart'
    as translation;

class ShareAyaaAsText extends StatelessWidget {
  const ShareAyaaAsText({
    super.key,
    required this.firstVerse,
    required this.lastVerse,
    required this.surahNumber,
    required this.verseNumber,
  });

  final int firstVerse;
  final int lastVerse;
  final int surahNumber;
  final int verseNumber;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        List<String> verses = [];
        for (int i = firstVerse; i <= lastVerse; i++) {
          try {
            // Fetching the verse with end symbol
            verses.add(getVerse(
              surahNumber,
              verseNumber,
            ));
          } catch (e) {
            // Catch and log any issues with missing verses
            print("No verse found for Surah $surahNumber, Verse $i: $e");
          }
        }

        String contentToShare = "";

        // If Tafseer is enabled, process translations
        if (getHiveSavedDataBool("addTafseer")) {
          String tafseer = "";

          for (int verseNumber = firstVerse;
              verseNumber <= lastVerse;
              verseNumber++) {
            try {
              String cTafseer = await translation.getVerseTranslation(
                surahNumber,
                verseNumber,
                translationDataList[getHiveSavedData("addTafseerValue")],
              );

              tafseer = "$tafseer $cTafseer ";
            } catch (e) {
              print(
                  "No translation found for Surah $surahNumber, Verse $verseNumber");
            }
          }

          contentToShare =
              "{ ${verses.join('')} }[${getSurahNameArabic(surahNumber)}: $firstVerse - $lastVerse]\n\n"
              "${translationDataList[getHiveSavedData("addTafseerValue")].typeTextInRelatedLanguage}:\n"
              "${removeHtmlTags(tafseer)}\n\n"
              "${getHiveSavedData("appLogo") ? "Shared with Noury" : ""}";
        } else {
          contentToShare =
              "{${verses.join('')}} \n [${getSurahNameArabic(surahNumber)}: $firstVerse - $lastVerse]"
              "${getHiveSavedData("appLogo") ? " Shared with Noury" : ""}";
        }

        print("Content to share: $contentToShare");

        try {
          await Share.share(contentToShare, subject: "Quran Verse");
        } catch (e) {
          print("Error while sharing: $e");
        }
      },
      child: Text(
        'مشاركه كنص ',
        style: TextStyle(
          color: fiveColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
