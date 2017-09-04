library kot_flut_1.main_app;

import 'package:flutter/material.dart';
import 'package:kot_flut_1/CreateReminderPage.dart';
import 'package:kot_flut_1/HomePage.dart';


class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kot Flut 1',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: "Home Page",),
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