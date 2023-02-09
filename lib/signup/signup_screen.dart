import 'package:flutter/material.dart';
import 'package:fluttercalls/locator/locator.dart';
import 'package:fluttercalls/signup/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => locator(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: Column(
            children: [
              TextFormField(
                controller: context.read<SignUpViewModel>().emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: context.read<SignUpViewModel>().passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              TextButton(
                onPressed: context.read<SignUpViewModel>().signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
