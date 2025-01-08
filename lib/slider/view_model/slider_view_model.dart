import 'package:flutter/cupertino.dart';

class SliderViewModel extends ChangeNotifier {
  double _value = 0.5;

  double getValue() => _value;

  changeOpecity(double value) {
    _value = value;
    notifyListeners();
  }
}
