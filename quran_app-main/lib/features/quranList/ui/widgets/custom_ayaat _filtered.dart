import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';

class CustomAyaatFiltered extends StatelessWidget {
  const CustomAyaatFiltered({
    super.key,
    required this.ayaa,
    this.onTap,
  });

  final dynamic ayaa;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: secondColor,
            boxShadow: [
              BoxShadow(
                color: threeColor,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            children: [
              Text(
                " سورة ${getSurahNameArabic(
                  ayaa['surah'],
                )}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kprimaryDarkColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(getVerse(ayaa['surah'], ayaa['verse'], verseEndSymbol: true),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
