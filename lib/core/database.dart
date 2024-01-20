import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeDatabaseHelper {
  static final EmployeeDatabaseHelper _instance =
      EmployeeDatabaseHelper._internal();

  factory EmployeeDatabaseHelper() => _instance;

  EmployeeDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'employee_database.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE employees(
      id TEXT PRIMARY KEY,
      employee_name TEXT,
      employee_role TEXT,
      currentDate TEXT,
      previousDate TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS deleted_employees(
       id TEXT PRIMARY KEY,
       employee_name TEXT,
       employee_role TEXT,
       currentDate TEXT,
       previousDate TEXT
    )  
  ''');
  }

  Future<void> insertEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    await db.insert('employees', employee,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    await db.update(
      'employees',
      employee,
      where: 'id = ?',
      whereArgs: [employee['id']],
    );
  }

  Future<void> deleteEmployee(String id) async {
    final db = await database;
    final employee = await getEmployeeById(id);

    if (employee != null) {
      // Move the deleted item to the 'deleted_employees' table
      await db.insert('deleted_employees', employee);
    }

    // Delete the item from the 'employees' table
    await db.delete(
      'employees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> undoDelete() async {
    final db = await database;

    // Retrieve the last deleted item from 'deleted_employees' table
    final deletedItem =
        await db.query('deleted_employees', orderBy: 'ROWID DESC', limit: 1);

    if (deletedItem.isNotEmpty) {
      // Move the item back to the 'employees' table
      await db.insert('employees', deletedItem.first);

      // Remove the item from 'deleted_employees' table
      await db.delete('deleted_employees',
          where: 'id = ?', whereArgs: [deletedItem.first['id']]);
    }
  }

  Future<Map<String, dynamic>?> getEmployeeById(String id) async {
    final db = await database;
    final result =
        await db.query('employees', where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    final db = await database;
    return db.query('employees');
  }
}
