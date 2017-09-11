library kot_flut_1.main_app;

import 'package:flutter/material.dart';
import 'package:kot_flut_1/CreateReminderPage.dart';
import 'package:kot_flut_1/RemindersListPage.dart';
import 'package:kot_flut_1/model.dart';


class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MaintAppState();
}


class _MaintAppState extends State<MainApp> implements AppContext {

  List<Reminder> reminders = [
    new Reminder("Reminder 1"),
    new Reminder("Reminder 2"),
    new Reminder("Reminder 3"),
    new Reminder("Reminder 4"),
    new Reminder("Reminder 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kot Flut 1',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new RemindersListPage(reminders: reminders),
      routes: <String, WidgetBuilder>{
        ':reminder': (BuildContext context) => new CreateReminderPage(
          onSubmitted: _createReminder_submitted,
        )
      },
      onGenerateRoute: _getRoute,
    );
  }


  Route<Null> _getRoute(RouteSettings settings) {
    return new MaterialPageRoute(
      builder: (BuildContext ctx) => new Scaffold(
          body: new Center(
              child: new Text('Not found')
          )
      ),
    );
  }

  void _createReminder_submitted(String text) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      reminders.add(new Reminder(text));
    });
  }
}