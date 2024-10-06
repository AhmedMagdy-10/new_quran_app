import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/core/components/app_logo.dart';
import 'package:quran_app/core/helper/build_verse_spans.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/features/quranDetails/logic/translation/translationdata.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/basmala.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/header_widget.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/share_ayaa_as_image.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/tafsser_text.dart';
import 'package:screenshot/screenshot.dart';

class SurahScreenshot extends StatelessWidget {
  const SurahScreenshot({
    super.key,
    required this.screenshotController,
    required this.indexOfTheme,
    required this.widget,
    required this.firstVerse,
    required this.lastVerse,
  });

  final ScreenshotController screenshotController;
  final int? indexOfTheme;
  final ShareAyaaAsImagepPage widget;
  final int firstVerse;
  final int lastVerse;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        color: indexOfTheme != null
            ? backgroundColors[indexOfTheme!]
            : kprimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              HeaderWidget(
                e: {"surah": widget.surahNumber},
                jsonData: '',
                indexOfTheme: indexOfTheme,
              ),
              if ((widget.firstVerse == 1 &&
                  widget.pageNumber != 1 &&
                  widget.pageNumber != 187))
                Basmala(
                  index: indexOfTheme ?? 50,
                ),
              SizedBox(height: 10.h),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: RichText(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  textWidthBasis: TextWidthBasis.longestLine,
                  locale: const Locale("ar"),
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: indexOfTheme != null
                          ? primaryColors[indexOfTheme!]
                          : Colors.black,
                    ),
                    children: buildVerseSpans(widget.surahNumber, firstVerse,
                        lastVerse, widget.verseNumber, indexOfTheme),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              if (getHiveSavedData('addTafseerImage') == true)
                Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translationDataList[
                                getHiveSavedData("addTafseerValue") ?? 0]
                            .typeTextInRelatedLanguage,
                        style: TextStyle(
                          color: threeColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      FutureBuildTafseerText(
                        surahNumber: widget.surahNumber,
                        firstVerse: firstVerse,
                        lastVerse: lastVerse,
                        indexOfTheme: indexOfTheme,
                      ),
                    ],
                  ),
                ),
              const AppLogo()
            ],
          ),
        ),
      ),
    );
  }
}
