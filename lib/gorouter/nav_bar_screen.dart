import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen(this.child, {super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (value) {
          switch (value) {
            case 0:
              context.go('/first');
              break;
            case 1:
              context.go('/second');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Second',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    if (location.startsWith('/first')) {
      return 0;
    }
    if (location.startsWith('/second')) {
      return 1;
    }
    return 0;
  }
}
