// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calspace/pages/articles_page.dart';
import 'package:calspace/pages/calendar_page.dart';
import 'package:calspace/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => HomePage(),
            )
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/calendarpage',
              builder: (context, state) {
                return CalendarPage();
              },
            )
          ],
        ),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
              path: '/articlespage',
              builder: (context, state) {
                return Articles();
              })
        ])
      ],
    )
  ],
);

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tiles'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar')
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'GoRouter Routes';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CalSpace',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      //routerDelegate: _router.routerDelegate,
      //routeInformationParser: _router.routeInformationParser,
      //routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
