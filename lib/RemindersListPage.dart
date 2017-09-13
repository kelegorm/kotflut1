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

          return new ListTile(
            title: new Text(
                text,
                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black)
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () => _deleteItem(context, snapshot)
            ),
          );
        }
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(child: new Text("Drawer")),
            new ListTile(
              title: const Text('Add Reminder shortcut'),
              onTap: () {
                platform.send("make_icon");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ':reminder'),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _deleteItem(BuildContext context, DataSnapshot snapshot) {
    reminders.child(snapshot.key).remove();
  }
}