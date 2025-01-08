import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/counter/view_model/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Provider.of<CounterProvider>(context, listen: false)
                  //     .decrement();
                  context.read<CounterProvider>().decrement();
                },
                child: Text('Drmnt')),
            Consumer(
              builder: (ctx, _, child) => Text(
                  // "${Provider.of<CounterProvider>(ctx, listen: true).getCount()}"
                  "${ctx.watch<CounterProvider>().getCount()}"),
            ),
            ElevatedButton(
                onPressed: () {
                  // Provider.of<CounterProvider>(context, listen: false)
                  //     .increament();
                  context.read<CounterProvider>().increament();
                },
                child: Text('Inrmnt')),
          ],
        ),
      ),
    );
  }
}
