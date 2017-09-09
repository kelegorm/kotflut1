library kot_flut_1.home_page;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kot_flut_1/model.dart';


class RemindersListPage extends StatefulWidget {
  final List<Reminder> reminders;


  RemindersListPage({Key key, this.reminders}) : super(key: key);


  @override
  _ReminderListPageState createState() => new _ReminderListPageState(reminders: reminders);
}


class _ReminderListPageState extends State<RemindersListPage> {
  static const String _channel = 'increment';

  static const String REMINDERS_TITLE = 'Reminders';

  static const BasicMessageChannel<String> platform =
      const BasicMessageChannel<String>(_channel, const StringCodec());

  List<Reminder> reminders;


  _ReminderListPageState({this.reminders});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(REMINDERS_TITLE),
      ),
      body: new ListView.builder(
        itemBuilder: (context, i) => new ListTile(title: new Text(reminders[i].text)),
        itemCount: reminders.length,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }


  Future _onPressed() async {
    String text = await Navigator.pushNamed(context, ':reminder');
    if (text != null) {
      setState(() {
        reminders.add(new Reminder(text));
      });
    }
  }

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
////      _counter++;
//
//      platform.send("sended message");
//      print("+ button clicked");
//    });
//  }
}

/*
old center with buttons to create icon and add reminder
      new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '${_counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            new MaterialButton(
              child: new Text("add reminder"),
              onPressed: () {
                // Don't use there [popAndPushNamed], it leads to black screen
                // by back button instead of home page.
                // May be from drawer [popAndPushNamed] can work normally, popping drawer away.
//                Navigator.popAndPushNamed(context, '/reminder');
                Navigator.pushNamed(context, ':reminder');
              },
            ),
            new MaterialButton(
              child: new Text("add shortcut"),
              onPressed: () {
                platform.send("make_icon");
              },
            )
          ],
        ),
      )
 */