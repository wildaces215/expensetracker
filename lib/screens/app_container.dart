import 'package:expensetracker/screens/expense_screen.dart';
import 'package:expensetracker/screens/settings_screen.dart';
import 'package:expensetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  List _widgets = [ExpenseScreen(), SettingScreen()];
  int _widgetIndex = 0;

  void changeScreen(int index) {
    setState(() {
      _widgetIndex = index;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_widgetIndex),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewExpense()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        onTap: changeScreen,
        currentIndex: _widgetIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
