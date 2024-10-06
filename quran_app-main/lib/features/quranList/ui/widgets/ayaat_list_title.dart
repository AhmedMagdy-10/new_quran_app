import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/features/quranList/logic/models/surah_model.dart';

class AyaatListTitle extends StatelessWidget {
  const AyaatListTitle({
    super.key,
    required this.ayah,
  });

  final SurahModel ayah;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          ayah.name,
          style: TextStyle(
            fontSize: 22.sp,
            fontFamily: 'AmiriQuran',
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          ayah.englishName,
          style: TextStyle(
            fontSize: 17.sp,
            color: const Color(0xff007258),
          ),
        ),
        subtitle: Text(
          "${ayah.numberOfAyahs.toString()} عدد الايات",
          style: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/image/end_of_verse.svg',
              width: 30.h,
              height: 30.h,
            ),
            Text(
              ayah.number.toString(),
              style: const TextStyle(
                color: Color(0xff007258),
                fontSize: 15,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ));
  }
}
