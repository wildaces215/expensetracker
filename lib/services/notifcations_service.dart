import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;

class NotificationService {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  //final BehaviorSubject<RecievedNotifcation>;
  NotificationService._() {
    init();
  }
  void init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _IOSPermission();
    }
    initPlatformSpecifics();
  }

  initPlatformSpecifics() {
    var initIosSettings = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (id, title, body, payload) async {});
  }

  _IOSPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: false,
          badge: false,
          sound: true,
        );
  }
}

class RecievedNotifcation {
  final int id;
  final String title;
  final String body;
  final String payload;
  RecievedNotifcation(this.id, this.title, this.body, this.payload);
}
