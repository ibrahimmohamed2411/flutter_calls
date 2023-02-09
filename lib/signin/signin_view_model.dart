import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercalls/config/router/routes.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../locator/locator.dart';

@injectable
class SignInViewModel extends ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _navigationService = locator<NavigationService>();
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _navigationService.navigateTo(Routes.home);
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    _navigationService.navigateTo(Routes.signInScreen);
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
