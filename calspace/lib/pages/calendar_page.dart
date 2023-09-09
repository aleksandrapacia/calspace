import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;

  const CalendarPage(
      {super.key, required this.passedColor, required this.passedColorName});
  @override
  _CalendarPageState createState() => _CalendarPageState(
        passedColor: passedColor,
        passedColorName: passedColorName,
      );
}

class _CalendarPageState extends State<CalendarPage> {
  Color passedColor;
  String passedColorName;
  _CalendarPageState(
      {required this.passedColor, required this.passedColorName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 100, width: double.infinity, color: widget.passedColor),
          Text('${widget.passedColorName} color was passed'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('GO BACK'),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Center(child: Text('Calendar Page')),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
