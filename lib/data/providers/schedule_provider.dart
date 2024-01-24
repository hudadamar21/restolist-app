import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/helpers/schedule_helper.dart';
import 'package:restaurant_app/data/helpers/time_helper.dart';
import 'package:restaurant_app/data/utils/notification_service.dart';

class ScheduleProvider extends ChangeNotifier {
  ScheduleHelper preferencesHelper;
  ScheduleProvider({required this.preferencesHelper}) {
    _getDailyReminderPreferences();
  }
  bool _isDailyReminderActive = false;
  bool get isDailyReminderActive => _isDailyReminderActive;

  void _getDailyReminderPreferences() async {
    _isDailyReminderActive = await preferencesHelper.isDailyReminderActive;
    notifyListeners();
  }

  Future<bool> enableDailyReminder(bool value) async {
    _isDailyReminderActive = value;
    preferencesHelper.setDailyReminder(value);
    notifyListeners();
    if (_isDailyReminderActive) {
      if (kDebugMode) {
        print('Daily Reminder Active');
      }
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        NotificationService.callback,
        startAt: TimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      if (kDebugMode) {
        print('Daily Reminder Non Active');
      }
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
