import 'package:flutter/cupertino.dart';
import 'package:provider_tutorial/apicalling/model/user_model.dart';
import 'package:provider_tutorial/apicalling/utils/log_utils.dart';
import 'package:provider_tutorial/apicalling/utils/routes/route_name.dart';
import 'package:provider_tutorial/apicalling/view_model/user_view_model.dart';

class SplashServices {
  static void checkAuthentication(BuildContext context) async {
    getUser().then((value) {
      LogUtil.debug(value.token);
      LogUtil.debug(value.userName);
      if (value.token == null || value.userName == null) {
        Navigator.pushNamed(context, RouteName.login);
      } else {
        Navigator.pushNamed(context, RouteName.home);
      }
    });
  }

  static Future<UserModel> getUser() => UserViewModel().getUser();
}
