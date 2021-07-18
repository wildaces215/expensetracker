import 'package:flutter/material.dart';
import 'package:expensetracker/controller/controller.dart';
import 'package:get/get.dart';

class NewExpense extends StatefulWidget {
  NewExpenseState createState() => NewExpenseState();
}

class NewExpenseState extends State<NewExpense> {
  final DbController _controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('New Expense', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  _controller.setNewExpense();
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(16)),
            FittedBox(
                child: Text('Please enter the name of the transaction'),
                fit: BoxFit.fitWidth),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(controller: _controller.titleController),
            ),
            FittedBox(
              child: Text(
                '\nPlease enter the amount',
                textScaleFactor: 1.10,
              ),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _controller.amountController,
                keyboardType: TextInputType.number,
              ),
            ),
            FittedBox(
                child: Text('Please select the category of the expense'),
                fit: BoxFit.fitWidth),
            Padding(
                padding: EdgeInsets.all(16),
                child: DropdownButton<String>(
                  value: _controller.category,
                  items: <String>[
                    'Personal',
                    'Enterainment',
                    'Automotive',
                    'Medical',
                    'Other'
                  ].map<DropdownMenuItem<String>>((String _value) {
                    return DropdownMenuItem<String>(
                      value: _value,
                      child: Text(_value),
                    );
                  }).toList(),
                  onChanged: (String _newValue) {
                    setState(() {
                      _controller.category = _newValue;
                    });
                  },
                )),
          ],
        ));
  }
}
