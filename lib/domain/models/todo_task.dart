enum TodoTaskStatus { active, done, deleted }

class TodoTask {
  final String id;
  final String title;
  final String description;
  final TodoTaskStatus status;

  const TodoTask({
    required this.id,
    required this.title,
    required this.description,
    this.status = TodoTaskStatus.active,
  });

  TodoTask copyWith({
    String? id,
    String? title,
    String? description,
    TodoTaskStatus? status,
  }) {
    return TodoTask(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
