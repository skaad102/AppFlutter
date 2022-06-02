import 'package:flutter/material.dart';

class ColorTheme {
  static Color primary = const Color(0xFF00b894);
  static Color secundary = const Color(0xFF00cec9);
  static Color tercery = const Color(0xFF0984e3);
  static Color background = const Color(0xFF6c5ce7);
  static Color text = const Color(0xFF636e72);

  static ThemeData get materialTheme {
    return ThemeData(
      primaryColor: primary,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: text),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primary),
        ),
      ),
    );
  }
}
