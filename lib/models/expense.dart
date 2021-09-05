class Expense {
  int id;
  String expense;
  double amount;
  String category;
  Expense({this.id, this.expense, this.amount, this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expense': expense,
      'amount': amount,
      'category': category
    };
  }
}
