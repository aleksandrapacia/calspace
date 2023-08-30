import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(
          gap: 8,
          color: Colors.white,
          activeColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          tabBackgroundColor: Color.fromARGB(255, 157, 121, 255),
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(icon: Icons.home, text: 'Home 01'),
            GButton(icon: Icons.calendar_month, text: 'Calendar'),
            GButton(icon: Icons.article, text: 'Articles'),
            GButton(icon: Icons.login, text: 'LogIn')
          ]),
    );
  }
}