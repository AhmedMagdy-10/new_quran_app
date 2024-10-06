import 'package:flutter/material.dart';
import 'package:quran_app/constant/colors.dart';

class Basmala extends StatelessWidget {
  const Basmala({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: (size.width * .2),
            right: (size.width * .2),
            top: 8,
            bottom: 2),
        child: Image.asset(
          'assets/image/Basmala.png',
          color: index == 50 ? Colors.black : primaryColors[index],
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
