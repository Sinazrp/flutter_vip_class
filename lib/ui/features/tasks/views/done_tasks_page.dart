import 'package:flutter/material.dart';
import '../../../../domain/models/todo_task.dart';

class DoneTasksPage extends StatelessWidget {
  const DoneTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks =
        ModalRoute.of(context)?.settings.arguments as List<TodoTask>? ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Done Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tasks.isEmpty
            ? const Center(child: Text('No done tasks yet.'))
            : ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
