import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) deleteTask;
  final Function(Task) updateTask;

  TaskList({
    required this.tasks,
    required this.deleteTask,
    required this.updateTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
          deleteTask: deleteTask,
          updateTask: updateTask,
        );
      },
    );
  }
}
