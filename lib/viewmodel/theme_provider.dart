import 'package:flutter/material.dart';

class ThemeProviderViewModel extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
    print("Dark mode $isDarkMode");
  }
}
