import 'package:flutter/cupertino.dart';
import 'package:provider_tutorial/apicalling/repository/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final myRepo = AuthRepository();

  Future<void> login(Map<String, dynamic> data) async {
    myRepo
        .login(data)
        .then(
          (value) {},
        )
        .onError(
      (error, stackTrace) {
        print(error.toString());
      },
    );
  }
}
//eve.holt@raqras
