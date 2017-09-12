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
        textTheme: Theme.of(context).textTheme,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.schedule), onPressed: () {}),
          new MaterialButton(
            onPressed: () => {},
            child: new Text("Save".toUpperCase()),
            textColor: Colors.blue,
          )
        ],
        //leading: new Text("leading"), //todo set close icon
      ),
      backgroundColor: new Color(0xffe0e0e0),
      body: new Column(
        children: <Widget>[
          new DecoratedBox(
            decoration: new BoxDecoration(
              color: new Color(0xffffffff),
            ),
            child: new ListTile(
              title: new TextField(
                decoration: new InputDecoration(
                  isDense: true,
                  hideDivider: true,
                  helperText: 'helper text',
                  hintText: 'Remember to...',
                  hintStyle: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black54.withAlpha(170)),
                ),
                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                autofocus: true,
                onSubmitted: (text) => _textField_submitted(text, context),
              ),
              leading: new Icon(
                Icons.note,
                color: Colors.blue,
            ),
            ),
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