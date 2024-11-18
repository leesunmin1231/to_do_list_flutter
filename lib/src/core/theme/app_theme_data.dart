import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData light = ThemeData(
    textTheme: textTheme.copyWith(
        titleMedium: textTheme.titleMedium?.copyWith(color: Colors.black)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.deepOrange,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
  );

  static final ThemeData dark = ThemeData(
    textTheme: textTheme.copyWith(
      titleMedium: textTheme.titleMedium?.copyWith(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
    titleMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  );
}
