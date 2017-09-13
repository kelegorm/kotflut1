library kot_flut_1.main_app;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kot_flut_1/CreateReminderPage.dart';
import 'package:kot_flut_1/RemindersListPage.dart';
import 'package:kot_flut_1/model.dart';


class MainApp extends StatefulWidget {
  final DatabaseReference _reminders;

  MainApp({DatabaseReference reminders}) : this._reminders = reminders;

  @override
  State<StatefulWidget> createState() => new _MainAppState(_reminders);
}


class _MainAppState extends State<MainApp> implements AppContext {

  DatabaseReference _reminders;


  _MainAppState(this._reminders);


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kot Flut 1',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new RemindersListPage(reminders: _reminders),
      routes: <String, WidgetBuilder>{
        ':reminder': (BuildContext context) => new CreateReminderPage(
          reminders: _reminders,
        )
      },
      onGenerateRoute: _getRoute,
    );
  }


  Route<Null> _getRoute(RouteSettings settings) {
    var path = settings.name.split('/');
    if (path[0] != '') return null;

    if (path[1] == 'reminder') {
      var key = path[2];
      return new MaterialPageRoute(
          settings: settings,
          builder: (ctx) => new CreateReminderPage(reminders:_reminders, recId: key)
      );
    }

    return new MaterialPageRoute(
      builder: (BuildContext ctx) => new Scaffold(
          body: new Center(
              child: new Text('Not found')
          )
      ),
    );
  }
}