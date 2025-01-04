import 'package:flutter/material.dart';
import 'package:provider_tutorial/apicalling/resources/app_color.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.loading = false});

  final String title;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          height: 70,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.blueColor),
          child: Center(child: Text(title)),
        ));
  }
}
