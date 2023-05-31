import 'package:flutter/material.dart';
import 'package:promotion/core/constant/color.dart';


ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle:TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 25),
    backgroundColor: Colors.indigoAccent,
  ),
  textTheme:  const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.indigoAccent
  ),
  textTheme:  const TextTheme(

      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
