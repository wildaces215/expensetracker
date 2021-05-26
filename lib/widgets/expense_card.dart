import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final double expense;
  ExpenseCard(this.title, this.expense);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: InkWell(
        child: Card(
          child: ListTile(
              leading: Text(title), trailing: Text(expense.toString())),
        ),
      ),
    ));
  }
}
