import 'package:flutter/material.dart';

import '../layout/home_layout.dart';

class BtmProv extends ChangeNotifier {
  void btmnav(int index) {
    indexbtm = index;
    notifyListeners();
  }
}
