import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../database/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DatabaseHelper _dbHelper;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _loadTasks();
  }

  void _loadTasks() async {
    List<Task> loadedTasks = await _dbHelper.getTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  void _addTask(Task task) async {
    await _dbHelper.insertTask(task);
    _loadTasks();
  }

  void _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadTasks();
  }

  void _updateTask(Task task) async {
    await _dbHelper.updateTask(task);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced To-Do List'),
      ),
      body: TaskList(
        tasks: tasks,
        deleteTask: _deleteTask,
        updateTask: _updateTask,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTask != null) {
            _addTask(newTask);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
