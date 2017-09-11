library kot_flut_1.create_reminder_page;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef OnSubmitted<String>(String value);


class CreateReminderPage extends StatelessWidget {

  final OnSubmitted onSubmitted;


  CreateReminderPage({this.onSubmitted});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Reminder"),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              autofocus: true,
              onSubmitted: (text) => _textField_submitted(text, context),
            ),
            leading: new Icon(Icons.note),
          ),
        ]
      )
    );
  }

  void _textField_submitted(String text, BuildContext context) {
    if (onSubmitted != null) onSubmitted(text);

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}