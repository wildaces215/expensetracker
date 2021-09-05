import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:sqflite/sqlite_api.dart';

class DbClass {
  DbClass._privateConstructor();
  static final instance = DbClass._privateConstructor();
  static const VERSION = 1;

  static const TABLE_NAME = 'expenses';
  static const ID = 'id';
  static const EXPENSE_NAME = 'expense';
  static const AMOUNT = 'amount';
  static const CATEGORY = 'category';

  Future<String> retrievePath() async {
    return join(await getDatabasesPath(), 'db.db');
  }

  Future<Database> init() async {
    return await openDatabase(await retrievePath(), version: VERSION,
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY,$EXPENSE_NAME TEXT,$AMOUNT REAL,$CATEGORY TEXT)');
    });
  }

  Future<List<Map<String, dynamic>>> allExpenses() async {
    final db = await DbClass.instance.init();
    var res = await db.rawQuery("SELECT * FROM $TABLE_NAME");

    return res;
  }

  Future<int> newExpense(Expense _newExpense) async {
    final db = await DbClass.instance.init();
    print(_newExpense.id);
    print(_newExpense.expense);
    print(_newExpense.category);
    var res = await db.insert(DbClass.TABLE_NAME, _newExpense.toMap());

    return res;
  }

  Future<int> deleteExpense(int _id) async {
    Database db = await DbClass.instance.init();
    print(_id);
    return await db
        .delete(DbClass.TABLE_NAME, where: '$ID=?', whereArgs: [_id]);
  }

  Future<List<Map>> getCategories() async {
    Database db = await DbClass.instance.init();
    return await db.rawQuery("SELECT $CATEGORY,$AMOUNT FROM $TABLE_NAME");
  }
}
