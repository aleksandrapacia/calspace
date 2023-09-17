import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Center(
        child: Text('Observation Form'),
      ),
      contentPadding: EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(children: <Widget>[
          Text('Observation Name'),
          Text('How did/will you observe it'),
          Text('When did/will you observe it'),
        ]),
      ),
    );
  }
}
