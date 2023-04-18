import 'package:flutter/material.dart';
import 'package:todo_c7_mon/layout/home_layout.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';

import '../main.dart';

class Provcl extends ChangeNotifier {
  String dropdownvalue = 'English';
  String Modesvalue = 'Light';

  void changelang(String lang) {
    dropdownvalue = lang;
    notifyListeners();
  }

  void changemode(String mode) {
    Modesvalue = mode;
    theme = mode == 'Light' ? MyThemeData.lightTheme : MyThemeData.DarkTheme;
    notifyListeners();
  }

  void Notify() {
    notifyListeners();
  }
}
