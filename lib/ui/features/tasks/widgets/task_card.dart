import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.markDone,
    required this.deleteTask,
  });

  final String title;
  final String description;
  final VoidCallback markDone;
  final VoidCallback deleteTask;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: markDone,
              tooltip: 'Mark done',
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: deleteTask,
              tooltip: 'Delete task',
            ),
          ],
        ),
      ),
    );
  }
}
