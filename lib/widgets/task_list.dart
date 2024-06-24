import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) toggleTask;
  final Function(Task) deleteTask;

  const TaskList(
      {super.key, required this.tasks,
      required this.toggleTask,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
          toggleTask: toggleTask,
          deleteTask: deleteTask,
        );
      },
    );
  }
}
