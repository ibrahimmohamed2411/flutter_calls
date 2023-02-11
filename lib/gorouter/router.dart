import 'package:flutter/material.dart';
import 'fourth_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'first_screen.dart';
import 'nav_bar_screen.dart';

GoRouter goRouter() => GoRouter(
      navigatorKey: StackedService.navigatorKey,
      // initialLocation: '/first',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => FirstScreen(),
        ),
        GoRoute(
          path: '/second',
          builder: (context, state) => const SecondScreen(),
        ),
        GoRoute(
          path: '/third',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: ThirdScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
          redirect: (context, state) {
            if (!isAuthenticated()) {
              return '/fourth';
            }
            return null;
          },
        ),
        // ShellRoute(
        //   builder: (context, state, child) {
        //     return NavBarScreen(child);
        //   },
        //   routes: <RouteBase>[
        //     GoRoute(
        //       path: '/first',
        //       builder: (context, state) => FirstScreen(),
        //     ),
        //     GoRoute(
        //       path: '/second',
        //       builder: (context, state) => const SecondScreen(),
        //     ),
        //   ],
        // ),
        // GoRoute(
        //   path: '/third',
        //   pageBuilder: (context, state) {
        //     return CustomTransitionPage(
        //       child: ThirdScreen(),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        //   redirect: (context, state) {
        //     if (!isAuthenticated()) {
        //       return '/fourth';
        //     }
        //     return null;
        //   },
        // ),
        // GoRoute(
        //   path: '/fourth',
        //   builder: (context, state) => const FourthScreen(),
        // ),
      ],
    );

bool isAuthenticated() {
  return true;
}
