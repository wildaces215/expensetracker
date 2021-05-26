import 'package:test/test.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:expensetracker/models/expense.dart';

void main() {
  // Init ffi loader if needed.

  const VERSION = 1;

  const TABLE_NAME = 'expenses';
  const ID = 'id';
  const EXPENSE_NAME = 'expense';
  const AMOUNT = 'amount';

  sqfliteFfiInit();
  test('SQL Crud tests', () async {
    var db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute(
        "CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY, $EXPENSE_NAME TEXT, $AMOUNT REAL)");
    expect(await db.getVersion(), 0);
    Expense insert = Expense(id: 0, expense: "Starbucks", amount: 2.45);
    await db.insert(TABLE_NAME, insert.toMap());
    //expect(db.);
    await db.close();
  });
}
