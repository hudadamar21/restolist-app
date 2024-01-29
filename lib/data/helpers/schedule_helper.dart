import 'package:shared_preferences/shared_preferences.dart';

class ScheduleHelper {
  final Future<SharedPreferences> sharedPreferences;

  ScheduleHelper({required this.sharedPreferences});

  static const dailyReminder = '';

  Future<bool> get isDailyReminderActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyReminder) ?? false;
  }

  void setDailyReminder(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyReminder, value);
  }
}
