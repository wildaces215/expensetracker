import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;

import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationService {
  static final NotificationService _noti = NotificationService._internal();
  factory NotificationService() {
    return _noti;
  }
  NotificationService._internal();
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  void init() {
    var iOSinit = new IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (id, title, body, payload) async {});
    var initSettings = new InitializationSettings(iOS: iOSinit);
    _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initSettings);
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    print("notifcation initialized");
  }

  showNotification() async {
    var iosDetails = new IOSNotificationDetails(threadIdentifier: 'thread_id');
    var generalNotificationDetails = new NotificationDetails(iOS: iosDetails);
    return await _flutterLocalNotificationsPlugin.show(1, "Hey There!",
        "Any expenses you want to track?", generalNotificationDetails,
        payload: 'test payload');
  }

  void callMe() {
    print("hI");
  }
}
