import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int getCount() => _count;

  //event
  increament() {
    _count++;
    notifyListeners();
  }

  //event
  decrement() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }
}
