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
        ':reminder': (BuildContext context) => new CreateReminderPage()
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
}