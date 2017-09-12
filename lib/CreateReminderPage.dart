library kot_flut_1.create_reminder_page;

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';


class CreateReminderPage extends StatelessWidget {

  final DatabaseReference _reminders;


  CreateReminderPage({@required DatabaseReference ref})
      : _reminders = ref
  {
    assert(_reminders != null);
  }


  @override
  Widget build(BuildContext context) {
    String reminderText;

    return new Scaffold(
        backgroundColor: new Color(0xffe0e0e0),

        appBar: new AppBar(
          title: new Text("Reminder"),
          textTheme: Theme.of(context).textTheme,
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.white,
          // BACK BUTTON
          leading: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () => _navigationBack(context)
          ),
          actions: <Widget>[
            // SCHEDULE BUTTON
            new IconButton(
                icon: new Icon(Icons.schedule),
                onPressed: () {}),// Todo
            // SAVE BUTTON
            new MaterialButton(
              child: new Text("Save".toUpperCase()),
              textColor: Colors.blue,
              onPressed: () => _textField_submitted(reminderText, context),
            )
          ],
        ),

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
                  onChanged: (text) => reminderText = text,
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
    _navigationBack(context);
  }

  void _navigationBack(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}