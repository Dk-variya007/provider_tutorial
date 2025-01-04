import 'package:flutter/material.dart';
import 'package:provider_tutorial/apicalling/utils/routes/route_name.dart';
import 'package:provider_tutorial/apicalling/view/home_screen.dart';

import '../../view/login_screen.dart';
class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Route Define"),
            ),
          ),
        );
    }
  }
}
