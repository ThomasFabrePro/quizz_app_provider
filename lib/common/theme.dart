import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 2, 94),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeConfig.primaryColor,
    ),
  ),
  textTheme: const TextTheme(
    // displayLarge: TextStyle(
    //   fontFamily: 'Corben',
    //   fontWeight: FontWeight.w700,
    //   fontSize: 24,
    //   color: Colors.white,
    // ),
    bodyMedium: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
  ),
);

class ThemeConfig {
  static const Color primaryColor = Color.fromARGB(255, 71, 253, 183);
  static const Color secondaryColor = Color.fromARGB(255, 74, 10, 126);
  // static const Color secondaryColor = Color.fromARGB(166, 94, 15, 158);
  static const Color tertiaryColor = Color.fromARGB(255, 30, 2, 94);
  static const Color complementaryTertiaryColor =
      Color.fromARGB(255, 58, 4, 184);
  static const double maxWidth = 800;
  static const double appBarFontSize = 24;
  static const TextStyle elevatedButtonTextStyle =
      TextStyle(fontSize: 24, color: tertiaryColor);
}
