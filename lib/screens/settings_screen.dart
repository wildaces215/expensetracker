import 'package:flutter/material.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingsScreen> {
  bool _isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          //toolbarTextStyle: TextStyle(color: Colors.black),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
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
              )
            ],
          ),
        ));
  }
}
