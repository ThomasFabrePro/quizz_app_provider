import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 2, 94),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeConfig.primaryColor,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
  ),
);

class ThemeConfig {
  static const Color primaryColor = Color.fromARGB(255, 71, 253, 183);
  static const Color tertiaryColor = Color.fromARGB(255, 30, 2, 94);
}
