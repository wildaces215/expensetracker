import 'package:flutter/material.dart';

class MetricsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Total Expenses',
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline1.color,
                ),
              ))
        ],
      ),
      ListView(children: [],)
    ));
  }
}
