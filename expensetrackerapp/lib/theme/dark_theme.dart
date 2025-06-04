import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF222831),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF393E46),
      titleTextStyle: TextStyle(
        color: Color(0xFFDFD0B8),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Color(0xFFDFD0B8)),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFDFD0B8), // Light Accent
      secondary: Color(0xFF948979), // Medium
      background: Color(0xFF222831), // Darkest
      surface: Color(0xFF393E46), // Dark
      onPrimary: Color(0xFF222831),
      onSecondary: Color(0xFF222831),
      onSurface: Color(0xFFDFD0B8),
      onBackground: Color(0xFFDFD0B8),
      error: Colors.redAccent,
      onError: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFDFD0B8)),
      bodyMedium: TextStyle(color: Color(0xFFDFD0B8)),
      titleLarge: TextStyle(color: Color(0xFFDFD0B8)),
    ),
    cardColor: const Color(0xFF393E46),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF948979),
        foregroundColor: const Color(0xFF222831),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFF393E46),
      filled: true,
      border: OutlineInputBorder(),
      hintStyle: TextStyle(color: Color(0xFFDFD0B8)),
      labelStyle: TextStyle(color: Color(0xFFDFD0B8)),
    ),
  );
}
