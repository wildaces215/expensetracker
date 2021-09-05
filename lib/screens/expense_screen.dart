import 'package:expensetracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:expensetracker/controller/controller.dart';

class ExpenseScreen extends StatelessWidget {
  final DbController _controller = Get.put(DbController());
  List _categories = [
    'Personal',
    'Enterainment',
    'Automotive',
    'Medical',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
                            child: Text(
                              'Welcome here are your expenses!',
                              textAlign: TextAlign.left,
                              textScaleFactor: 2.0,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                              ),
                            )))
                  ],
                ),
                Expanded(
                    child: Obx(() => ListView.builder(
                        itemCount: _controller.data.length,
                        itemBuilder: (context, index) => InkWell(
                              onDoubleTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Are you sure you want to delete?',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .color)),
                                        content: Row(
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  elevation: 0,
                                                  shadowColor: Colors.white),
                                              child: Text('Yes',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .color)),
                                              onPressed: () {
                                                _controller.setDeleteExpense(
                                                    _controller.data[index].id);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  elevation: 0,
                                                  shadowColor: Colors.white),
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .color),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                /*
                                _controller.setDeleteExpense(
                                    _controller.data[index].id);*/
                              },
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text(_controller
                                              .data[index].expense
                                              .toString()),
                                          content: Text("\$".toString() +
                                              _controller.data[index].amount
                                                  .toStringAsFixed(2)));
                                    });
                              },
                              child: ExpenseCard(
                                  _controller.data[index].expense,
                                  _controller.data[index].amount),
                            )))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
builder: (_dx) => ListView.builder(
                          itemCount: _dx.data.length,
                          itemBuilder: (context, index) {
                            return ExpenseCard(_dx.data[index].expense,
                                _dx.data[index].amount);

*/ 