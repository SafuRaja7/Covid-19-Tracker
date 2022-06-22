import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get theme => isDark;


  set theme(bool value) {
    isDark = value;
    notifyListeners();
  }
}
