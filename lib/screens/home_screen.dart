import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(String taskTitle) {
    setState(() {
      tasks.add(Task(title: taskTitle));
    });
  }

  void toggleTask(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: TaskList(
        tasks: tasks,
        toggleTask: toggleTask,
        deleteTask: deleteTask,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTaskTitle = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
          if (newTaskTitle != null) {
            addTask(newTaskTitle);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
