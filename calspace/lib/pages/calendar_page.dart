import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('go to home page'),
        ),
      ),
      bottomNavigationBar: const GNav(
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
