import 'package:expensetracker/models/expense_data.dart';
import 'package:expensetracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MetricsScreen extends StatelessWidget {
  final List<ExpenseBarData> _data = [
    ExpenseBarData('Automotive', 134.67),
    ExpenseBarData('Personal', 67.89),
    ExpenseBarData('Other', 45.89),
    ExpenseBarData('Medical', 234.56),
    ExpenseBarData('Rent', 1034.78)
  ];
  TooltipBehavior _tooltipBehavior;
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
              )),
          SfCircularChart(series: <CircularSeries>[
            PieSeries<ExpenseBarData, String>(
                dataSource: _data,
                xValueMapper: (ExpenseBarData _values, _) => _values.category,
                yValueMapper: (ExpenseBarData _values, _) => _values.total,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
          ]),
          Expanded(
            child: ListView(
              children: [
                ExpenseCard('Automotive', 134.67),
                ExpenseCard('Medicial', 234.56),
                ExpenseCard('Personal', 67.89),
                ExpenseCard('Rent', 1034.78),
                ExpenseCard('Other', 45.89)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
