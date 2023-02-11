import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttercalls/flutteranimate/flutter_animate_screen.dart';
import 'package:fluttercalls/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'gorouter/router.dart';
import 'locator/locator.dart';
import 'signin/signin_view_model.dart';

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
      // child: MaterialApp.router(
      //   routerConfig: goRouter(),
      //   // theme: ThemeData(
      //   // debugShowCheckedModeBanner: false,
      //   // navigatorKey: StackedService.navigatorKey,
      //   title: 'Flutter Demo',
      //   // home: CounterScreen(),
      //   // onGenerateRoute: AppRouter().onGenerateRoute,
      // ),
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: FlutterAnimateScreen(),
      ),
    );
  }
}
