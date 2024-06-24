import 'package:flutter/material.dart';
import '../models/task.dart';
import '../screens/task_detail_screen.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(int) deleteTask;
  final Function(Task) updateTask;

  TaskItem({
    required this.task,
    required this.deleteTask,
    required this.updateTask,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'Due: ${task.dueDate.toLocal()}'.split(' ')[0],
        ),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            Task updatedTask = Task(
              id: task.id,
              title: task.title,
              description: task.description,
              dueDate: task.dueDate,
              isDone: value!,
              priority: task.priority,
            );
            updateTask(updatedTask);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(
                task: task,
                updateTask: updateTask,
                deleteTask: deleteTask,
              ),
            ),
          );
        },
      ),
    );
  }
}
