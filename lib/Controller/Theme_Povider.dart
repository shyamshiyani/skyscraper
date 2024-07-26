import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool isDarkMode = false;

  ThemeData get themeData => isDarkMode ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
