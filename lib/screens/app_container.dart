import 'package:expensetracker/screens/expense_screen.dart';
import 'package:expensetracker/screens/metrics_screen.dart';
import 'package:expensetracker/screens/settings_screen.dart';
import 'package:expensetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  List _widgets = [ExpenseScreen(), MetricsScreen()];
  int _widgetIndex = 0;

  void changeScreen(int index) {
    setState(() {
      _widgetIndex = index;
    });
  }

  void initState() {
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            color: Colors.grey,
          )
        ],
      ),
      body: _widgets.elementAt(_widgetIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 104, 128, 128),
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
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Metrics')
        ],
        onTap: changeScreen,
        currentIndex: _widgetIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
