import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/apicalling/model/auth_view_model.dart';
import 'package:provider_tutorial/apicalling/view/login_screen.dart';
import 'package:provider_tutorial/counter/view_model/counter_provider.dart';
import 'package:provider_tutorial/crud/view_model/crud_provider.dart';

import 'apicalling/utils/routes/route_name.dart';
import 'apicalling/utils/routes/routes.dart';

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
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
