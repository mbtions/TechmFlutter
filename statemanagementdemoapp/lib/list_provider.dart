import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier {
  final List<int> numbers = [1, 2, 3, 4];

  void add() {
    numbers.add(numbers.last + 1); // it is a change
    notifyListeners(); // and the change is notified to all the consumers
  }

  void multiply() {
    numbers.add(numbers.last * 2);
    notifyListeners();
  }
}
