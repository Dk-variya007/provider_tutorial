import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/slider/view_model/slider_view_model.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<SliderViewModel>(
            builder: (ctx, value, child) => Container(
              width: 300,
              height: 300,
              color: Colors.red.withOpacity(value.getValue()),
            ),
          ),
          SizedBox(height: 20),
          Consumer<SliderViewModel>(
            builder: (ctx, value, child) => Slider(
              value: value.getValue(),
              onChanged: (value) {
                context.read<SliderViewModel>().changeOpecity(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
