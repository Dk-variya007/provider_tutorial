import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/theme/view_model/theme_view_model.dart';

class AppThemeScreen extends StatelessWidget {
  const AppThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThemeScreen"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Light') {
                context.read<ThemeViewModel>().setTheme(ThemeMode.light);
              }
              if (value == 'Dark') {
                context.read<ThemeViewModel>().setTheme(ThemeMode.dark);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Light',
                child: Text('Light'),
              ),
              PopupMenuItem(
                value: 'Dark',
                child: Text('Dark'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
