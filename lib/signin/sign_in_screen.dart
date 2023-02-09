import 'package:flutter/material.dart';
import 'package:fluttercalls/config/router/routes.dart';
import 'package:fluttercalls/signin/signin_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SignInViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: model.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: model.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextButton(
              onPressed: model.login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signUpScreen);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
