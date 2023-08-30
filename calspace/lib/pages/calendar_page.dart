import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
            GButton(icon: Icons.home, text: 'Home '),
            GButton(icon: Icons.calendar_month, text: 'Calendar'),
            GButton(icon: Icons.article, text: 'Articles'),
            GButton(icon: Icons.login, text: 'LogIn')
          ]),
    );
  }
}
