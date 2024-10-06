import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
    required this.e,
    required this.jsonData,
    this.indexOfTheme,
  });

  var e;
  var jsonData;
  final int? indexOfTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/image/888-02-Recovered.png',
              width: MediaQuery.sizeOf(context).width.w,
              height: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.7.w, vertical: 7.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "اياتها\n${getVerseCount(e['surah'])}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'uthmanic',
                      fontWeight: FontWeight.w800,
                      color: indexOfTheme != null
                          ? primaryColors[indexOfTheme!]
                          : Colors.black),
                ),
                Center(
                  child: Text(
                    getSurahNameArabic(
                      e["surah"],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "uthmanic",
                        fontSize: 22,
                        color: indexOfTheme != null
                            ? primaryColors[indexOfTheme!]
                            : Colors.black),
                  ),
                ),
                Text(
                  "ترتيبها\n${e['surah']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'uthmanic',
                      fontWeight: FontWeight.w800,
                      color: indexOfTheme != null
                          ? primaryColors[indexOfTheme!]
                          : Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
