import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttercalls/config/router/routes.dart';
import 'package:fluttercalls/locator/locator.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignUpViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _navigation = locator<NavigationService>();

  signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .set({
      'email': emailController.text,
      'password': passwordController.text,
      'fcmToken': fcmToken,
    });
    _navigation.navigateTo(Routes.landingScreen);
  }
}
