import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

class AppTheme {
  ThemeData appTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: appBgColor,
    appBarTheme: AppBarTheme().copyWith(
      elevation: 6,
      color: appTextColor,
      backgroundColor: appBgColor,
      shadowColor: Colors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 136, 195, 243),
      ),
    ),
  );
}
