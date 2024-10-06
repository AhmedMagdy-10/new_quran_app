import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/constant/colors.dart';

class CustomPageNumber extends StatelessWidget {
  const CustomPageNumber({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: fiveColor,
          ),
          SizedBox(
            width: 24.w,
          ),
          Text(
            "$index",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 28.w,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: fiveColor,
          ),
        ],
      ),
    );
  }
}
