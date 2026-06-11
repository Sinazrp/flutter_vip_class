import '../../domain/models/todo_task.dart';

class TaskRepository {
  final List<TodoTask> _tasks = [];

  List<TodoTask> getAll() => List.unmodifiable(_tasks);

  void addTask(TodoTask task) {
    _tasks.add(task);
  }
}
