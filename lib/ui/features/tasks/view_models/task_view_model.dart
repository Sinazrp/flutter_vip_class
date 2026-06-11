import '../../../../domain/models/todo_task.dart';

class TaskViewModel {
  final List<TodoTask> _activeTasks = [];
  final List<TodoTask> _doneTasks = [];
  final List<TodoTask> _deletedTasks = [];

  TodoTask _draft = const TodoTask(id: '', title: '', description: '');

  List<TodoTask> get activeTasks => List.unmodifiable(_activeTasks);
  List<TodoTask> get doneTasks => List.unmodifiable(_doneTasks);
  List<TodoTask> get deletedTasks => List.unmodifiable(_deletedTasks);
  TodoTask get draft => _draft;

  void updateTitle(String title) {
    _draft = _draft.copyWith(title: title);
  }

  void updateDescription(String description) {
    _draft = _draft.copyWith(description: description);
  }

  bool addTask() {
    if (_draft.title.trim().isEmpty) return false;

    final task = _draft.copyWith(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: _draft.title.trim(),
      description: _draft.description.trim().isEmpty
          ? 'No description'
          : _draft.description.trim(),
    );

    _activeTasks.add(task);
    _draft = const TodoTask(id: '', title: '', description: '');
    return true;
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
