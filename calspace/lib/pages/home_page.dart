// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:calspace/pages/calendar_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Choose color of the page'),
            ElevatedButton(
              child: Text('Purple'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalendarPage(
                        passedColor: Colors.purple, passedColorName: 'Purple'),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Blue'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalendarPage(
                      passedColor: Colors.blue,
                      passedColorName: 'Blue',
                    ),
                  ),
                );
              },
            ),
            Container(color: Colors.transparent, width: 100, height: 500),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalendarPage(
                      passedColor: Colors.pink,
                      passedColorName: 'Blue',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: const Text('Observations')),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
