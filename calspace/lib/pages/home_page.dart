// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Todo {
  final String title;
  final String descritpion;

  const Todo(this.title, this.descritpion);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: Colors.red,
        child: Text('Observations'),
      )),
      appBar: AppBar(
        title: Center(child: const Text('Observations')),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
