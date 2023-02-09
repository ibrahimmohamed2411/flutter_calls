import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttercalls/config/router/app_router.dart';
import 'package:fluttercalls/locator/locator.dart';
import 'package:fluttercalls/signin/signin_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
      ],
      child: MaterialApp(
        navigatorKey: StackedService.navigatorKey,
        title: 'Flutter Demo',
        // home: SignInScreen(),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
