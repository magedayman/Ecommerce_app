import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

// english theme
ThemeData appEnglishTheme = ThemeData(
    fontFamily: "OpenSans",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: appColors.primaryColor, fontSize: 18),
      centerTitle: true,
      iconTheme: IconThemeData(color: appColors.primaryColor),
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontFamily: "Trajan Pro",
            wordSpacing: 5,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: appColors.blue),
        displayMedium: TextStyle(
            fontFamily: "Trajan Pro",
            wordSpacing: 5,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: appColors.blue),
        bodyLarge: TextStyle(
            height: 2,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: appColors.grey),
        titleMedium: TextStyle(
            fontFamily: "Trajan Pro",
            color: appColors.primaryColor,
            fontSize: 19,
            fontWeight: FontWeight.w500)));

// Arabic theme............................

ThemeData appArabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 21, fontWeight: FontWeight.bold, color: appColors.blue),
        displayMedium: TextStyle(
            fontSize: 19, fontWeight: FontWeight.bold, color: appColors.blue),
        bodyLarge: TextStyle(
            height: 2,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: appColors.grey),
        titleMedium: TextStyle(
            color: appColors.primaryColor,
            fontSize: 19,
            fontWeight: FontWeight.w500)));
