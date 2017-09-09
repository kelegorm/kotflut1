library kot_flut_1.main_app;


abstract class AppContext {
  List<Reminder> get reminders;
}

class Reminder {
  String text;

  Reminder([this.text = ""]);
}