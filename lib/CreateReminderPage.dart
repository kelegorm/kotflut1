library kot_flut_1.create_reminder_page;

import 'package:flutter/material.dart';


//typedef OnSubmitted<String>(String value);


class CreateReminderPage extends StatelessWidget {

//  final OnSubmitted onSubmitted;


  CreateReminderPage(/*{this.onSubmitted}*/);


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
              onSubmitted: (text) => Navigator.of(context).pop(text),
            ),
            leading: new Icon(Icons.note),
          ),
//          new Text("Create reminder page"),
        ]
      )
    );
  }
}