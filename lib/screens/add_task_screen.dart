import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (newText) {
                newTaskTitle = newText;
              },
              decoration: const InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  Navigator.pop(context, newTaskTitle);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
