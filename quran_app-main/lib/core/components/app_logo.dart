import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/constant/colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'بواسطه تطبيق نوري',
          style: TextStyle(color: threeColor, fontSize: 10, fontFamily: 'taha'),
        ),
        SizedBox(
          width: 5.w,
        ),
        CircleAvatar(
          backgroundImage: const AssetImage(
            'assets/image/ic_launcher.png',
          ),
          radius: 10,
          backgroundColor: secondColor,
          foregroundColor: Colors.grey,
        ),
      ],
    );
  }
}
