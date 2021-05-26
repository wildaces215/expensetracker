import 'package:expensetracker/models/expense.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/services/db.dart';

class DbController extends GetxController {
  var data = <Expense>[]?.obs;
  TextEditingController titleController;
  TextEditingController amountController;

  @override
  void onInit() {
    super.onInit();
    getExpenses();
    titleController = TextEditingController();
    amountController = TextEditingController();
  }

  void getExpenses() {
    DbClass.instance.allExpenses().then((value) {
      value.forEach((element) {
        data.add(Expense(
            id: element['id'],
            expense: element['expense'],
            amount: element['amount']));
      });
    });
  }

  void setDeleteExpense(int _id) async {
    DbClass.instance.deleteExpense(_id);
    data.removeWhere((element) => element.id == _id);
  }

  void setNewExpense() async {
    await DbClass.instance.newExpense(Expense(
        expense: titleController.text,
        amount: double.parse(amountController.text)));
    data.add(Expense(
        expense: titleController.text,
        amount: double.parse(amountController.text)));
    titleController.clear();
    amountController.clear();
  }
}
