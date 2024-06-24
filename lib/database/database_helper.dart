import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  String tasksTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDueDate = 'dueDate';
  String colIsDone = 'isDone';
  String colPriority = 'priority';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_list.db');

    final taskListDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return taskListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tasksTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colDueDate TEXT, $colIsDone INTEGER, $colPriority INTEGER)',
    );
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(tasksTable);
    return result;
  }

  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    final List<Task> taskList = [];
    taskMapList.forEach((taskMap) {
      taskList.add(Task.fromMap(taskMap));
    });
    return taskList;
  }

  Future<int> insertTask(Task task) async {
    Database? db = await this.db;
    final int result = await db!.insert(tasksTable, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database? db = await this.db;
    final int result = await db!.update(
      tasksTable,
      task.toMap(),
      where: '$colId = ?',
      whereArgs: [task.id],
    );
    return result;
  }

  Future<int> deleteTask(int id) async {
    Database? db = await this.db;
    final int result = await db!.delete(
      tasksTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
