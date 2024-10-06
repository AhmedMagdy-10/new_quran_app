import 'package:flutter/material.dart';
import 'package:quran_app/constant/style.dart';

Color quranPagesColorLight = const Color(0xffF1EEE5);
Color quranPagesColorDark = const Color.fromRGBO(41, 44, 49, 1);
Color kprimaryColor = const Color(0xfffffaf5);
Color secondColor = const Color(0xfffceddc);
Color threeColor = const Color(0xff966e3c);
Color fourColor = const Color(0xff795547);
Color fiveColor = const Color(0xff651c24);
Color kprimaryDarkColor = const Color(0xfffeab1f);
Color secondDarkColor = const Color(0xfff8480d);
Color specialColor = const Color(0xFF2196F3);
Color specialGreen = const Color(0xff007258);

const Color primaryColor = Color(0xffC7B7A3);
const Color accentColor = Color.fromARGB(255, 141, 74, 29);
const Color backgroundColor = Color.fromARGB(255, 247, 248, 255);

const List primaryColors = [
  Color.fromARGB(255, 141, 74, 29),
  Colors.black,
  Color(0XFf4C76BA),
  Color(0xff651c24),
  Colors.white,
  Color(0xffBFAE99),
  Color.fromARGB(255, 255, 255, 255),
  Color.fromARGB(255, 255, 211, 167),
  Color.fromARGB(255, 0, 0, 0),
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.white,
];
const List backgroundColors = [
  Color(0xffFFFCE7),
  Color.fromARGB(255, 255, 248, 240),
  Colors.white,
  Colors.white,
  Color(0xff22303C),
  Color(0xff213440),
  Color(0xff6d6d6d),
  Color(0xff4e4c4f),
  Color(0xfff3f6f4),
  Color.fromARGB(255, 38, 38, 38),
  Color(0xffE7F7FE),
  Color(0xffF4FDD3),
  Color(0xffFEEED4),
  Color(0xffD2F4CF),
  Color(0xffFEFADF),
  Color(0xffEAF0FE),
  Color.fromARGB(255, 100, 218, 206),
  Color.fromARGB(255, 143, 182, 245),
];
const List secondaryColors = [
  Color.fromARGB(255, 107, 87, 0),
  Color.fromARGB(255, 88, 47, 0),
  Color.fromARGB(255, 43, 43, 43),
  Color.fromARGB(255, 0, 95, 184),
  Color.fromARGB(255, 23, 147, 255),
  Color.fromARGB(255, 102, 95, 0),
  Color.fromARGB(255, 255, 204, 129),
  Color.fromARGB(255, 255, 180, 82),
  Color.fromARGB(255, 22, 21, 20),
  Color.fromARGB(255, 38, 38, 38),
  Color.fromARGB(255, 18, 28, 32),
  Color.fromARGB(255, 28, 29, 23),
  Color.fromARGB(255, 58, 45, 23),
  Color.fromARGB(255, 31, 46, 29),
  Color.fromARGB(255, 36, 34, 22),
  Color.fromARGB(255, 24, 29, 43)
];
const List highlightColors = [
  Color.fromARGB(255, 255, 244, 157),
  Color.fromARGB(172, 255, 201, 54),
  Color.fromARGB(255, 89, 216, 255),
  Color.fromARGB(255, 89, 216, 255),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 255, 244, 157),
  Color.fromARGB(255, 255, 244, 157),
  Color.fromARGB(255, 255, 244, 157),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 255, 244, 157),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 120, 192, 255),
  Color.fromARGB(255, 120, 192, 255),
];

ThemeData lightTheme(BuildContext context) => ThemeData(
      // fontFamily: 'Cairo',
      scaffoldBackgroundColor: kprimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: kprimaryColor,
        titleTextStyle: TextStyle(
          color: fourColor,
          fontSize: responsiveFontSize(context, fontSize: 32),
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w300,
          fontSize: responsiveFontSize(context, fontSize: 20),
          color: threeColor,
        ),
        titleLarge: TextStyle(
          color: fourColor,
          fontSize: responsiveFontSize(context, fontSize: 32),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 28,
          color: threeColor,
          fontFamily: 'Cairo',
        ),
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: quranPagesColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor: quranPagesColorDark,
        titleTextStyle: TextStyle(
          color: fourColor,
          fontSize: responsiveFontSize(context, fontSize: 32),
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w300,
          fontSize: responsiveFontSize(
            context,
            fontSize: 20,
          ),
          color: kprimaryDarkColor,
        ),
        titleLarge: TextStyle(
          color: kprimaryDarkColor,
          fontSize: responsiveFontSize(context, fontSize: 32),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          fontSize: 28,
          fontFamily: 'Cairo',
          color: Color.fromARGB(255, 235, 152, 27),
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'Cairo',
          color: threeColor,
        ),
      ),
    );
