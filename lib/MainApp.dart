library kot_flut_1.main_app;

import 'package:flutter/material.dart';
import 'package:kot_flut_1/CreateReminderPage.dart';
import 'package:kot_flut_1/HomePage.dart';


class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print("""Building MainApp""");
    return new MaterialApp(
      title: 'Kot Flut 1',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: "Home Page",),
      initialRoute: null,
      routes: <String, WidgetBuilder>{
//        '/':         (BuildContext context) => new MyHomePage(title: "Home Page",),
        '/reminder': (BuildContext context) => new CreateReminderPage()
      },
      onGenerateRoute: _getRoute,
    );
  }


  Route<Null> _getRoute(RouteSettings settings) {
    print('_getRoute: ${settings.name}');
    return null;
  }
}