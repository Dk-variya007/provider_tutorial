import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(UserModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', model.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return true;
  }
}
