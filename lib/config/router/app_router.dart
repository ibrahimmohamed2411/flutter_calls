import 'package:flutter/material.dart';
import 'package:fluttercalls/landing/landing_screen.dart';
import 'package:fluttercalls/signin/sign_in_screen.dart';
import 'package:fluttercalls/signup/signup_screen.dart';

import '../../home/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case Routes.landingScreen:
        return MaterialPageRoute(
          builder: (context) => LandingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Route not found'),
            ),
          ),
        );
    }
  }
}
