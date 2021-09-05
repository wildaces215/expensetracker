import 'dart:convert';

import 'package:expensetracker/models/expense.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/services/db.dart';
import 'dart:core';

class DbController extends GetxController {
  var data = <Expense>[].obs;
  var categoriesDict = {
    'Personal': 0.0,
    'Enterainment': 0.0,
    'Automotive': 0.0,
    'Medical': 0.0,
    'Other': 0.0
  }.obs;
  double _personalAmount = 0.0;
  double _entairnmentAmount = 0.0;
  double _automotiveAmount = 0.0;
  double _medicalAmount = 0.0;
  double _otherAmount = 0.0;

  TextEditingController titleController;
  TextEditingController amountController;
  TextEditingController categoryController;
  String category;
  @override
  void onInit() {
    super.onInit();
    getExpenses();
    titleController = TextEditingController();
    amountController = TextEditingController();
  }

//Gets expenses when called.
  void getExpenses() {
    DbClass.instance.allExpenses().then((value) {
      value.forEach((element) {
        data.add(Expense(
            id: element['id'],
            expense: element['expense'],
            amount: element['amount'],
            category: element['category']));
      });
    });
  }

//Deletes expense when user clicks on it.
  Future<int> setDeleteExpense(int _id) async {
    data.removeWhere((element) => element.id == _id);
    return await DbClass.instance.deleteExpense(_id);
  }

//creates a new expense
  void setNewExpense() async {
    print(category);
    await DbClass.instance.newExpense(Expense(
        expense: titleController.text,
        amount: double.parse(amountController.text),
        category: category));
    // ignore: await_only_futures
    await data.add(Expense(
        expense: titleController.text,
        amount: double.parse(amountController.text),
        category: category));
    titleController.clear();
    amountController.clear();
    category = null;
  }

  //Adds expenses to categories for metrics screen
  void setExpensesToMap() async {
    print(data);
    for (var x in data) {
      if (x.category == 'Personal') {
      } else if (x.category == '') {
      } else if (x.category == '') {
      } else if (x.category == '') {
      } else if (x.category == '') {
      } else {
        _otherAmount = x.amount;
      }
    }
    //print(categoriesDict);
  }
  //x[] gets the value for the data returned from database.
}
