import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';

ThemeData themeEn = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    fontFamily: "Roboto",
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        headlineMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: primaryColer),
        headlineSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColer),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(color: Colors.grey, fontSize: 18),
        bodyMedium: TextStyle(color: Colors.grey, fontSize: 15),
        bodySmall: TextStyle(color: Colors.grey, fontSize: 12)));
ThemeData themeAr = ThemeData(
    fontFamily: "Roboto",
    colorSchemeSeed: Colors.blue,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: primaryColer),
        headlineSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColer),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(color: Colors.grey, fontSize: 18),
        bodyMedium: TextStyle(color: Colors.grey, fontSize: 15),
        bodySmall: TextStyle(color: Colors.grey, fontSize: 12)));

ThemeData getThemeForLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      print('تغير الثيم');
      return themeAr;

    default:
      return themeEn;
  }
}
