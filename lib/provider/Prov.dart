import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';

import '../layout/home_layout.dart';
import '../main.dart';

class Provcl extends ChangeNotifier {
  String dropdownvalue = 'English';
  String Modesvalue = 'Light';
  void btmnav(int index) {
    indexbtm = index;
    notifyListeners();
  }

  void changelang(String lang) {
    dropdownvalue = lang;
    notifyListeners();
  }

  void changemode(String mode) {
    Modesvalue = mode;
    theme = mode == 'Light' ? MyThemeData.lightTheme : MyThemeData.DarkTheme;
    print(mode);
    notifyListeners();
  }

  void Notify() {
    notifyListeners();
  }
}
