import 'package:flutter/material.dart';
import 'package:quran_app/constant/colors.dart';

abstract class FontsAppStyles {
  static TextStyle styleMeduim(BuildContext context) {
    return TextStyle(
      fontFamily: 'Cairo',
      fontSize: responsiveFontSize(context, fontSize: 20),
      color: threeColor,
    );
  }
}

double responsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);

  double responsiveFontSize = scaleFactor * fontSize;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 1000;
  } else {
    return width / 1800;
  }
}
