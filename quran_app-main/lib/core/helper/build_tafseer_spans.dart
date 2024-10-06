import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';

import '../../features/quranDetails/logic/translation/get_translation_data.dart'
    as translate;

Future<List<InlineSpan>> buildTafseerSpans(
  int surahNumber,
  int firstVerseNumber,
  int lastVerseNumber,
  translatee,
) async {
  List<InlineSpan> tafseerSpans = [];

  for (int verseNumber = firstVerseNumber;
      verseNumber <= lastVerseNumber;
      verseNumber++) {
    String verseText = getVerse(surahNumber, verseNumber);
    String text = await translate.getVerseTranslation(
        surahNumber, verseNumber, translatee);
    text = text.replaceAll("<p>", "\n").replaceAll("</p>", "");

    TextSpan translateSpan = TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: "roboto",
      ),
    );

    if (verseNumber > firstVerseNumber) {
      TextSpan dividerSpan = TextSpan(
        text: '\n———\n',
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "taha",
          color: Colors.blue,
        ),
      );
      tafseerSpans.add(dividerSpan);
    }

    tafseerSpans.add(translateSpan);
  }

  return tafseerSpans;
}
