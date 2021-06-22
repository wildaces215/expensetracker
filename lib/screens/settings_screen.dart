import 'package:flutter/material.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';
import 'package:expensetracker/services/notifcations_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class SettingsScreen extends StatefulWidget {
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingsScreen> {
  FlutterLocalNotificationsPlugin localNotificaiton;
  @override
  void initState() {
    super.initState();
    var iOSinit = new IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (id, title, body, payload) async {});
    var initSettings = new InitializationSettings(iOS: iOSinit);
    localNotificaiton = new FlutterLocalNotificationsPlugin();
    localNotificaiton.initialize(initSettings);
  }

  Future _showNotifcation() async {
    var iosDetails = new IOSNotificationDetails(threadIdentifier: 'thread_id');
    var generalNotifcationDetails = new NotificationDetails(iOS: iosDetails);
    await localNotificaiton.show(1, "Hey There!",
        "Any expenses you want to track?", generalNotifcationDetails,
        payload: 'test payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          //toolbarTextStyle: TextStyle(color: Colors.black),
          title: Text(
            'Settings',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Coming Soon!',
                textScaleFactor: 1.25,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
              TextButton(
                  onPressed: () async {
                    //_noti.init();

                    await _showNotifcation();
                  },
                  child: Text('Notifcation Button'))
            ],
          ),
        ));
  }
}
