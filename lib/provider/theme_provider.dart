import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.dark;
  bool get isLight => theme == ThemeMode.light;
  void updateTheme(ThemeMode newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}
