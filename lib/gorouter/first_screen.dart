import 'package:flutter/material.dart';
import 'package:fluttercalls/locator/locator.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked_services/stacked_services.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.push('/third');
          },
          child: Text('Go To Third Screen'),
        ),
      ),
    );
  }
}
