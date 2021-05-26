import 'package:flutter/material.dart';
import 'package:expensetracker/controller/controller.dart';
import 'package:get/get.dart';

class NewExpense extends StatelessWidget {
  final DbController _controller = Get.put(DbController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Expense'),
          actions: [
            IconButton(
                icon: Icon(Icons.backpack),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(
          children: [
            TextField(controller: _controller.titleController),
            TextField(controller: _controller.amountController),
            ElevatedButton(
                onPressed: () {
                  _controller.setNewExpense();
                  //print(_controller.titleController);
                },
                child: Text('Submit'))
          ],
        ));
  }
}
