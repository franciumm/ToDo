import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import '../moudles/tasks_list/tasks_list.dart';

class SlideProv extends ChangeNotifier {
  Tasksslide(position) {
    if (position == SlidableButtonPosition.end) {
      result = 'Done Tasks';
      print(result);
    } else {
      result = 'Tasks';
      print(result);
    }
    notifyListeners();
  }
}
