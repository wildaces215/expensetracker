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
    // ignore: non_constant_identifier_names
    final AndroidInitializationSettings androidInit =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSinit = new IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (id, title, body, payload) async {});
    var initSettings =
        new InitializationSettings(iOS: iOSinit, android: androidInit);
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
    var androidDetails = new AndroidNotificationDetails(
        'id', 'Sample Notification', 'Some description',
        importance: Importance.max, priority: Priority.high, showWhen: false);
    var generalNotificationDetails =
        new NotificationDetails(iOS: iosDetails, android: androidDetails);
    return await _flutterLocalNotificationsPlugin.show(1, "Hey There!",
        "Any expenses you want to track?", generalNotificationDetails,
        payload: 'test payload');
  }

  void callMe() {
    print("hI");
  }
}
