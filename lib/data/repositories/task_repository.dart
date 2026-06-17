import '../models/todo_task_model.dart';

class TaskRepository {
  final List<TodoTaskModel> _tasks = [];

  List<TodoTaskModel> getAll() => List.unmodifiable(_tasks);

  void addTask(TodoTaskModel task) {
    _tasks.add(task);
  }
}
