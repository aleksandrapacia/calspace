// ignore_for_file: prefer_const_constructors

import 'package:calspace/pages/calendar_page.dart';
import 'package:calspace/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
        path: '/calendarpage',
        builder: (BuildContext context, GoRouterState state) =>
            const CalendarPage())
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'GoRouter Routes';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CalSpace',
      debugShowCheckedModeBanner: false,
      //routerConfig: _router,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
