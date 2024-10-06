import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/constant/colors.dart';

class QuranStart extends StatelessWidget {
  const QuranStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimaryColor,
      width: MediaQuery.sizeOf(context).width.w,
      height: MediaQuery.sizeOf(context).height.h,
      child: Image.asset(
        'assets/image/Quran.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
