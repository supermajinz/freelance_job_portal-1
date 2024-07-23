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
          fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      bodyLarge: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w200),
      labelLarge: TextStyle(
          color: Color.fromARGB(255, 82, 82, 82),
          fontSize: 14,
          fontWeight: FontWeight.w100),
    ));

ThemeData getThemeForLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      print('تغير الثيم');
      return themeAr;

    default:
      return themeEn;
  }
}
