library kot_flut_1.create_reminder_page;

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kot_flut_1/main.dart';


typedef OnSubmitted<String>(String value);


class CreateReminderPage extends StatelessWidget {

  final OnSubmitted onSubmitted;

  final DatabaseReference _reminders;


  CreateReminderPage({this.onSubmitted, DatabaseReference ref}) : _reminders = ref
  {
    assert(_reminders != null);
  }


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

  Future _textField_submitted(String text, BuildContext context) async {
    _reminders.push().set({
      'text':text,
      //'creatorName': googleSignIn.currentUser.displayName,
    });


//    if (onSubmitted != null) onSubmitted(text);

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}