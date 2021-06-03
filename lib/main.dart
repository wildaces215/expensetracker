import 'package:expensetracker/screens/app_container.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/controller/controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

//80.6 %#abd0d1
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
  DbController controller = DbController();
  controller.getExpenses();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.playfairDisplay().fontFamily,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Color.fromARGB(255, 104, 128, 128),
                fontWeight: FontWeight.w900),
            bodyText1: TextStyle(
                color: Color.fromARGB(255, 104, 128, 128), fontSize: 17),
          )),
      home: AppContainer(),
    );
  }
}
