import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _list = [];

  //read
  List<Map<String, dynamic>> getData() => _list;

  //add
  addData(Map<String, dynamic> data) {
    _list.add(data);
    notifyListeners();
  }

  //update
  upData(int index, String name, String profession) {
    _list[index]['name'] = name;
    _list[index]['profession'] = profession;
    notifyListeners();
  }

  //delete
  deleteData(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
