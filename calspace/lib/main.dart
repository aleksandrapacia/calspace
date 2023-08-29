// ignore_for_file: prefer_const_constructors

<<<<<<< HEAD
=======
import 'package:calspace/pages/home_page.dart';
>>>>>>> b45240a74cb07c929e0e25f8ef07c7b6ff3bf72a
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalSpace',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
