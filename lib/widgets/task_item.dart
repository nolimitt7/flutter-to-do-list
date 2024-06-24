import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) toggleTask;
  final Function(Task) deleteTask;

  const TaskItem(
      {super.key, required this.task, required this.toggleTask, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          toggleTask(task);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          deleteTask(task);
        },
      ),
    );
  }
}
