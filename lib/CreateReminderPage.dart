library kot_flut_1.create_reminder_page;

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';


class CreateReminderPage extends StatefulWidget {

  final DatabaseReference reminders;
  final String recId;


  CreateReminderPage({ @required this.reminders, this.recId}) {
    assert(reminders != null);
  }


  @override
  State createState() => new _ReminderPageState(recId, reminders);
}


class _ReminderPageState extends State<CreateReminderPage> {
  final String recId;
  final DatabaseReference reminders;

  Map _data;
  String _reminderText = '';
  TextEditingController _controller;


  _ReminderPageState(this.recId, this.reminders);


  @override
  void initState() {
    super.initState();
    if (recId != null) {
      _loadData();
    }
    _controller = new TextEditingController(text: _reminderText);
  }

  @override
  Widget build(BuildContext context) {
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
          actions: _getControls(context),
        ),

        body: new Column(
          children: <Widget>[
            new DecoratedBox(
              decoration: new BoxDecoration(
                color: new Color(0xffffffff),
              ),
              child: new ListTile(
                title: new TextField(
                  controller: _controller,
                  decoration: new InputDecoration(
                    isDense: true,
                    hideDivider: true,
                    hintText: 'Remember to...',
                    hintStyle: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black54.withAlpha(170)),
                  ),
                  style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                  autofocus: true,
                  onSubmitted: (text) => _saveReminder(text, context),
                  onChanged: (text) => _reminderText = text,
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

  List<Widget> _getControls(BuildContext context) => <Widget>[
    // SCHEDULE BUTTON
    new IconButton(
        icon: new Icon(Icons.schedule),
        onPressed: () {}// Todo
    ),
    // SAVE BUTTON
    new MaterialButton(
      child: new Text("Save".toUpperCase()),
      textColor: Colors.blue,
      onPressed: () => _saveReminder(_reminderText, context),
    )
  ];

  Future _saveReminder(String text, BuildContext context) async {
    var newData = {
      'text':text,
      //'creatorName': googleSignIn.currentUser.displayName,
    };

    if (recId == null) {
      reminders.push().set(newData);
    } else {
      reminders.child(recId).set(newData);
    }

    _navigationBack(context);
  }

  void _navigationBack(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

  Future<Null> _loadData() async {
    var snapshot = await reminders.child(recId).once();
    setState(() {
      this._data = snapshot.value as Map;
      this._reminderText = _data['text'];
      _controller.text = _reminderText;
      _controller.selection = new TextSelection(
          baseOffset: _reminderText.length,
          extentOffset: _reminderText.length
      );
    });
  }
}