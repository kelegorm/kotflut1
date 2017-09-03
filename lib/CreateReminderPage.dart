library kot_flut_1.create_reminder_page;

import 'package:flutter/material.dart';


class CreateReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Reminder"),
      ),
      body: new Center(
        child: new Text("Create reminder page"),
      )
    );
  }
}