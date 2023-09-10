// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:calspace/pages/calendar_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _XTap(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.amber,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _XTap(context),
        child: Icon(Icons.add),
      ),
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
                        passedColor: Colors.blue, passedColorName: 'Blue'),
                  ),
                );
              },
            ),
            Container(color: Colors.transparent, width: 100, height: 500),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: const Text('Observations')),
      ),
    );
  }
}
