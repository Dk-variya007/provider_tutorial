import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodScreen extends StatefulWidget {
  const MethodScreen({super.key});

  @override
  State<MethodScreen> createState() => _MethodScreenState();
}

class _MethodScreenState extends State<MethodScreen> {
  var channel = MethodChannel("method");

  showToast() {
    channel.invokeMethod("method");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("Show Toast")),
      ),
    );
  }
}
