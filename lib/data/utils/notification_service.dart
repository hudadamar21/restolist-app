import 'dart:ui';
import 'dart:isolate';

import 'package:restaurant_app/data/helpers/notification_helper.dart';
import 'package:restaurant_app/data/services/restaurant_services.dart';
import 'package:restaurant_app/main.dart';

final ReceivePort port = ReceivePort();

class NotificationService {
  static NotificationService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  NotificationService._internal() {
    _instance = this;
  }

  factory NotificationService() => _instance ?? NotificationService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await RestaurantServices().getRestaurantList();
    await notificationHelper.showNotificationPic(
        flutterLocalNotificationsPlugin, result);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
