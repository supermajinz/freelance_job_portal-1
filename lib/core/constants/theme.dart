import 'package:flutter/material.dart';

ThemeData themeEn = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    fontFamily: "Roboto",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        bodySmall: TextStyle(height: 2, color: Colors.grey, fontSize: 14)));
ThemeData themeAr = ThemeData(
    fontFamily: "Roboto",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        bodySmall: TextStyle(height: 2, color: Colors.grey, fontSize: 14)));

ThemeData getThemeForLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      print('تغير الثيم');
      return themeAr;

    default:
      return themeEn;
  }
}
