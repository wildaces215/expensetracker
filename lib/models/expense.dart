class Expense {
  int id;
  String expense;
  double amount;
  Expense({this.id, this.expense, this.amount});

  Map<String, dynamic> toMap() {
    return {'id': id, 'expense': expense, 'amount': amount};
  }
}
