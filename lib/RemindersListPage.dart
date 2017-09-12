library kot_flut_1.home_page;

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kot_flut_1/model.dart';


class RemindersListPage extends StatefulWidget {
  final DatabaseReference reminders;


  RemindersListPage({Key key, this.reminders}) : super(key: key);


  @override
  _ReminderListPageState createState() => new _ReminderListPageState(reminders: reminders);
}


class _ReminderListPageState extends State<RemindersListPage> {
  static const String _channel = 'increment';

  static const String REMINDERS_TITLE = 'Reminders';

  static const BasicMessageChannel<String> platform =
      const BasicMessageChannel<String>(_channel, const StringCodec());

  DatabaseReference reminders;


  _ReminderListPageState({this.reminders});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(REMINDERS_TITLE),
      ),
      body: new FirebaseAnimatedList(
        query: reminders,
        itemBuilder: (context, snapshot, animation) {
          var data = snapshot.value as Map;
          var text = data['text'];

          return new ListTile(title: new Text(text));
        }
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ':reminder'),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}


/*
old button to create icon
    new MaterialButton(
      child: new Text("add shortcut"),
      onPressed: () {
        platform.send("make_icon");
      },
    )
 */