import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

// class AppTheme {
//   static final light = lightTheme;
//   static final dark = darkTheme;
// }

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
