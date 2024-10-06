import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/features/quranDetails/ui/surah_details_page.dart';
import 'package:quran_app/generated/l10n.dart';

class SurahHeaderName extends StatelessWidget {
  const SurahHeaderName({
    super.key,
    required this.widget,
    required this.index,
  });

  final SurahDetailsPage widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.w,
        left: 16.w,
        right: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${S.of(context).surah} ${widget.jsonData[getPageData(index)[0]["surah"] - 1].name}',
            style: TextStyle(
              fontSize: 24.sp,
              color: fiveColor,
            ),
          ),
          Text(
            '${S.of(context).Juz} ${getJuzNumber(getPageData(index)[0]["surah"], getPageData(index)[0]["start"])}',
            style: TextStyle(
              fontSize: 24.sp,
              color: fiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
