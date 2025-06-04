import 'package:flutter/material.dart';
import 'app_colors.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkCard,
      iconTheme: IconThemeData(color: AppColors.lightBackground),
      titleTextStyle: TextStyle(
        color: AppColors.lightBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: AppColors.darkCard,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText),
      bodyMedium: TextStyle(color: AppColors.darkText),
      labelLarge: TextStyle(color: AppColors.lightBackground),
    ),
    iconTheme: IconThemeData(color: AppColors.darkText),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.darkText),
      checkColor: MaterialStateProperty.all(AppColors.darkCard),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkText,
        foregroundColor: AppColors.darkBackground,
      ),
    ),
  );
}
