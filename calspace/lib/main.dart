// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calspace/pages/articles_page.dart';
import 'package:calspace/pages/calendar_page.dart';
import 'package:calspace/pages/home_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

//final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _tabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'tabNav');

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return navigationShell;
      },
      navigatorContainerBuilder: (BuildContext context,
          StatefulNavigationShell navigationShell, List<Widget> children) {
        return ScaffoldWithNavbar(
          navigationShell: navigationShell,
          children: children,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _tabNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (BuildContext, GoRouterState state) => HomePage(),
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
              path: '/articlespage/art',
              builder: (context, state) {
                return Articles();
              })
        ])
      ],
    )
  ],
);

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(
      {super.key, required this.navigationShell, required this.children});

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranchContainer(
          currentIndex: navigationShell.currentIndex, children: children),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Observations'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer(
      {super.key, required this.currentIndex, required this.children});

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        return AnimatedScale(
          scale: index == currentIndex ? 1 : 1.5,
          duration: const Duration(milliseconds: 400),
          child: AnimatedOpacity(
            opacity: index == currentIndex ? 1 : 0,
            duration: Duration(milliseconds: 400),
            child: _branchNavigatorWrapper(index, navigator),
          ),
        );
      },
    ).toList());
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
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
