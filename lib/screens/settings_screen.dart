import 'package:expensetracker/controller/controller.dart';
import 'package:expensetracker/services/notifcations_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingsScreen> {
  final DbController _controller = Get.put(DbController());
  NotificationService _noti;
  @override
  void initState() {
    super.initState();
    _noti = new NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        //toolbarTextStyle: TextStyle(color: Colors.black),
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
                title: Text('Licenses'),
                onTap: () {
                  showAboutDialog(
                      context: context,
                      children: [],
                      applicationName: 'The Miminalist Expense Tracker',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '');
                }),
            ListTile(
                title: Text('Noti test'),
                onTap: () async {
                  await _noti.showNotification();
                }),
            ListTile(
                title: Text('Category test'),
                onTap: () async {
                  print("Cat called");
                  await _controller.setExpensesToMap();
                })
          ],
        ),
      ),
    );
  }
}
