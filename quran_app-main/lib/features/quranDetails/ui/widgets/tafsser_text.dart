import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/core/helper/build_tafseer_spans.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/features/quranDetails/logic/translation/translationdata.dart';

class FutureBuildTafseerText extends StatelessWidget {
  const FutureBuildTafseerText({
    super.key,
    required this.surahNumber,
    required this.firstVerse,
    required this.lastVerse,
    this.indexOfTheme,
  });

  final int surahNumber;
  final int firstVerse;
  final int lastVerse;
  final int? indexOfTheme;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buildTafseerSpans(
        surahNumber,
        firstVerse,
        lastVerse,
        translationDataList[getHiveSavedData("addTafseerValue")],
      ),
      builder: (context, AsyncSnapshot<List<InlineSpan>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitWaveSpinner(
            color: Colors.white,
            size: 30,
          );
        } else if (snapshot.hasError) {
          return const Text('حدث خطأ في تحميل التقسير حاول مره اخري');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('لا يوجد تفسير متاح الان');
        } else {
          return TafsserWidget(
            snapshot: snapshot,
          );
        }
      },
    );
  }
}

class TafsserWidget extends StatelessWidget {
  const TafsserWidget({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<List<InlineSpan>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: RichText(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          textWidthBasis: TextWidthBasis.longestLine,
          locale: const Locale("ar"),
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.sp,
              color: fiveColor,
            ),
            children: snapshot.data,
          ),
        ),
      ),
    );
  }
}
