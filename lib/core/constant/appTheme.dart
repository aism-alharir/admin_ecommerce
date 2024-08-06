import 'package:flutter/material.dart';
import 'color.dart';

//theme English
ThemeData themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold),
        backgroundColor: AppColor.primaryColor),
    fontFamily: "Playfair_Display",
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 13),
    ));
// theme aribe
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 13),
    ));
