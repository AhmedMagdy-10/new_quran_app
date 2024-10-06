import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

List<InlineSpan> buildVerseSpans(int surahNumber, int firstVerseNumber,
    int lastVerseNumber, verseNumber, int? indexOfTheme) {
  List<InlineSpan> verseSpans = [];

  for (int verseNumber = firstVerseNumber;
      verseNumber <= lastVerseNumber;
      verseNumber++) {
    String verseText = getVerseQCF(surahNumber, verseNumber);
    if (verseNumber == firstVerseNumber) {
      verseText.replaceFirst(" ", "\n");
      verseText =
          "${verseText.substring(0, 2)}${verseText.substring(2, verseText.length)}";
    }

    int pageNumber = getPageNumber(surahNumber, verseNumber);
    // print("QCF_P${pageNumber.toString().padLeft(3, "0")}");
    TextSpan verseSpan = TextSpan(
      text: verseText.replaceAll(' ', ''),
      // recognizer: LongPressGestureRecognizer()..onLongPress = () {},
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        wordSpacing: 0,
        letterSpacing: 0,
        fontFamily: "QCF_P${pageNumber.toString().padLeft(3, "0")}",
      ),
    );

    verseSpans.add(verseSpan);
  }
  return verseSpans;
}
