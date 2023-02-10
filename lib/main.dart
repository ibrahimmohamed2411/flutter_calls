import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'gorouter/router.dart';
import 'locator/locator.dart';
import 'signin/signin_view_model.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// The route configuration.

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInViewModel(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter(),
        // theme: ThemeData(
        // debugShowCheckedModeBanner: false,
        // navigatorKey: StackedService.navigatorKey,
        title: 'Flutter Demo',
        // home: CounterScreen(),
        // onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
