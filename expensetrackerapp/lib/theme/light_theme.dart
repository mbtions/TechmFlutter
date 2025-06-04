import 'package:flutter/material.dart';
import 'app_colors.dart';

class LightTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightCard,
      iconTheme: IconThemeData(color: AppColors.darkBackground),
      titleTextStyle: TextStyle(
        color: AppColors.darkBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: AppColors.lightCard,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText),
      bodyMedium: TextStyle(color: AppColors.lightText),
      labelLarge: TextStyle(color: AppColors.darkBackground),
    ),
    iconTheme: IconThemeData(color: AppColors.lightText),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.lightText),
      checkColor: MaterialStateProperty.all(AppColors.lightCard),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightText,
        foregroundColor: AppColors.darkBackground,
      ),
    ),
  );
}
