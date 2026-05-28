import '../../../../domain/models/todo_task.dart';

class TaskViewModel {
  final List<TodoTask> _activeTasks = [];
  final List<TodoTask> _doneTasks = [];
  final List<TodoTask> _deletedTasks = [];

  List<TodoTask> get activeTasks => List.unmodifiable(_activeTasks);
  List<TodoTask> get doneTasks => List.unmodifiable(_doneTasks);
  List<TodoTask> get deletedTasks => List.unmodifiable(_deletedTasks);

  void addTask(TodoTask task) {
    _activeTasks.add(task);
  }

  void markDone(TodoTask task) {
    _activeTasks.removeWhere((item) => item.id == task.id);
    _doneTasks.add(task.copyWith(status: TodoTaskStatus.done));
  }

  void deleteTask(TodoTask task) {
    _activeTasks.removeWhere((item) => item.id == task.id);
    _deletedTasks.add(task.copyWith(status: TodoTaskStatus.deleted));
  }
}
