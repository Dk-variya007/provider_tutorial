import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/apicalling/view/home_screen.dart';
import 'package:provider_tutorial/apicalling/view/splash_screen.dart';
import 'package:provider_tutorial/apicalling/view_model/auth_view_model.dart';
import 'package:provider_tutorial/apicalling/view/login_screen.dart';
import 'package:provider_tutorial/counter/view_model/counter_provider.dart';
import 'package:provider_tutorial/crud/view_model/crud_provider.dart';
import 'package:provider_tutorial/favourite/view/favourite_screen.dart';
import 'package:provider_tutorial/favourite/view_model/favourite_view_model.dart';
import 'package:provider_tutorial/slider/view/slider_screen.dart';
import 'package:provider_tutorial/slider/view_model/slider_view_model.dart';
import 'package:provider_tutorial/theme/view/app_theme_screen.dart';
import 'package:provider_tutorial/theme/view_model/theme_view_model.dart';
import 'package:provider_tutorial/value_notifier/view/value_notifier_screen.dart';

import 'apicalling/utils/routes/route_name.dart';
import 'apicalling/utils/routes/routes.dart';
import 'apicalling/view_model/user_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (ctx) => CounterProvider(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => CrudProvider(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => AuthViewModel(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => SliderViewModel(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => FavouriteViewModel(),
    ),
    ChangeNotifierProvider(create: (ctx) => UserViewModel()),
    ChangeNotifierProvider(create: (ctx) => ThemeViewModel())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: Provider.of<ThemeViewModel>(context).themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
