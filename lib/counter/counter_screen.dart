import 'package:flutter/material.dart';
import 'package:fluttercalls/counter/counter_view_model.dart';
import 'package:fluttercalls/home/home_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: Builder(builder: (context) {
        print('all rebuided');
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  print('watched rebuided');
                  return Text(
                    context.select(
                      (CounterViewModel value) => value.count.toString(),
                    ),
                    // context.read<CounterViewModel>().count.toString()
                    // context.watch<CounterViewModel>().count.toString(),
                  );
                }),
                TextButton(
                  onPressed: context.read<CounterViewModel>().increment,
                  child: Text('+'),
                ),
                TextButton(
                  onPressed: context.read<CounterViewModel>().decrement,
                  child: Text('-'),
                ),
                TextButton(
                  onPressed: context.read<CounterViewModel>().sameValue,
                  child: Text('same'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
