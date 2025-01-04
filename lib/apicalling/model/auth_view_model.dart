import 'package:flutter/foundation.dart';
import 'package:provider_tutorial/apicalling/repository/auth_repo.dart';
import 'package:provider_tutorial/apicalling/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final myRepo = AuthRepository();

  Future<void> login(Map<String, dynamic> data, context) async {
    myRepo.login(data).then(
      (value) {
        Utils.flushBarErrorMessage('Login Successfully', context);
        if (kDebugMode) {
          print('');
         }
        },
    ).onError(
      (error, stackTrace){
        Utils.flushBarErrorMessage(error.toString(), context);
      },
    );
  }
}

