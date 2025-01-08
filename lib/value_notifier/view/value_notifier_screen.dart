import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  ValueNotifierScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) =>
                    Text(_counter.value.toString())),
            ElevatedButton(
                onPressed: () {
                  _counter.value++;
                },
                child: Text("Increase")),
            ValueListenableBuilder(
              valueListenable: _isVisible,
              builder: (context, value, child) => TextField(
                obscureText: _isVisible.value,
                decoration: InputDecoration(
                    suffix: IconButton(
                        onPressed: () {
                          _isVisible.value = !_isVisible.value;
                        },
                        icon: Icon(_isVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
