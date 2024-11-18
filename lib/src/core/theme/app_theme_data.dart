import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData light = ThemeData(
    textTheme: textTheme.copyWith(),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
  );

  static final ThemeData dark = ThemeData(
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(color: Colors.white),
        titleLarge: textTheme.titleLarge?.copyWith(color: Colors.white),
        titleMedium: textTheme.titleMedium?.copyWith(color: Colors.white),
        bodyLarge: textTheme.bodyLarge?.copyWith(color: Colors.white),
        bodyMedium: textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          prefixIconColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white));

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
    titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  );
}
