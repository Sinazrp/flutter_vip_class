import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/features/tasks/widgets/task_card.dart';
import '../../../core/Routes/app_routes.dart';
import '../../../../domain/models/profile.dart';
import '../../../../domain/models/todo_task.dart';
import '../view_models/task_view_model.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final _taskTitleController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _taskViewModel = TaskViewModel();

  Profile? profile;

  void _addTask() {
    setState(() {
      if (_taskViewModel.addTask()) {
        _taskTitleController.clear();
        _taskDescriptionController.clear();
      }
    });
  }

  void _markDone(TodoTask task) {
    setState(() {
      _taskViewModel.markDone(task);
    });
  }

  void _deleteTask(TodoTask task) {
    setState(() {
      _taskViewModel.deleteTask(task);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Profile) {
      profile = args;
    }
  }

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Tasks'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.doneTasks,
              arguments: _taskViewModel.doneTasks,
            ),
            icon: const Icon(Icons.check_circle_outline),
            tooltip: 'Done tasks',
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.deletedTasks,
              arguments: _taskViewModel.deletedTasks,
            ),
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Deleted tasks',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello, ${profile?.name ?? 'Student'}!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Age: ${profile?.age ?? '-'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Create a task',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _taskTitleController,
              decoration: const InputDecoration(
                labelText: 'Task title',
                border: OutlineInputBorder(),
              ),
              onChanged: _taskViewModel.updateTitle,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _taskDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Task description',
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 3,
              onChanged: _taskViewModel.updateDescription,
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _addTask, child: const Text('Add task')),
            const SizedBox(height: 16),
            Expanded(
              child: _taskViewModel.activeTasks.isEmpty
                  ? const Center(
                      child: Text('No tasks yet. Add a task to get started.'),
                    )
                  : ListView.separated(
                      itemCount: _taskViewModel.activeTasks.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final task = _taskViewModel.activeTasks[index];
                        return TaskCard(
                          title: task.title,
                          description: task.description,
                          markDone: () => _markDone(task),
                          deleteTask: () => _deleteTask(task),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
