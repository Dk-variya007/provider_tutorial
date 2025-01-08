import 'package:flutter/material.dart';
import 'package:provider_tutorial/apicalling/utils/routes/route_name.dart';
import 'package:provider_tutorial/apicalling/view/home_screen.dart';
import 'package:provider_tutorial/apicalling/view/sign_up_screen.dart';
import 'package:provider_tutorial/apicalling/view/splash_screen.dart';
import 'package:provider_tutorial/favourite/view/favourite_screen.dart';

import '../../view/login_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case RouteName.favourite:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
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
