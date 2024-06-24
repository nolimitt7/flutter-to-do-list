import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final Function(Task) updateTask;
  final Function(int) deleteTask;

  TaskDetailScreen({
    required this.task,
    required this.updateTask,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteTask(task.id!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${task.title}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${task.description}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Due Date: ${task.dueDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Priority: ${_priorityText(task.priority)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: task.isDone,
                  onChanged: (value) {
                    Task updatedTask = Task(
                      id: task.id,
                      title: task.title,
                      description: task.description,
                      dueDate: task.dueDate,
                      isDone: value,
                      priority: task.priority,
                    );
                    updateTask(updatedTask);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _priorityText(int priority) {
    switch (priority) {
      case 0:
        return 'Low';
      case 1:
        return 'Medium';
      case 2:
        return 'High';
      default:
        return 'Unknown';
    }
  }
}
