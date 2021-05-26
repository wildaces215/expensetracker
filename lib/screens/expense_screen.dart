import 'package:expensetracker/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:expensetracker/controller/controller.dart';

class ExpenseScreen extends StatelessWidget {
  final DbController _controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 8,
                    child: GetBuilder<DbController>(
                      builder: (_dx) => ListView.builder(
                          itemCount: _dx.data.length,
                          itemBuilder: (context, index) {
                            return ExpenseCard(_dx.data[index].expense,
                                _dx.data[index].amount);
                          }),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
