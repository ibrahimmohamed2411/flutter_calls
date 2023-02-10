import 'package:fluttercalls/gorouter/fourth_screen.dart';
import 'package:fluttercalls/gorouter/second_screen.dart';
import 'package:fluttercalls/gorouter/third_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'first_screen.dart';
import 'nav_bar_screen.dart';

GoRouter goRouter() => GoRouter(
      navigatorKey: StackedService.navigatorKey,
      initialLocation: '/first',
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) {
            return NavBarScreen(child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/first',
              builder: (context, state) => FirstScreen(),
            ),
            GoRoute(
              path: '/second',
              builder: (context, state) => const SecondScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/third',
          builder: (context, state) => const ThirdScreen(),
          redirect: (context, state) {
            if (!isAuthenticated()) {
              return '/fourth';
            }
            return null;
          },
        ),
        GoRoute(
          path: '/fourth',
          builder: (context, state) => const FourthScreen(),
        ),
      ],
    );

bool isAuthenticated() {
  return true;
}
