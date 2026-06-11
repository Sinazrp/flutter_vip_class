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

  factory TodoTask.fromMap(Map<String, dynamic> map) {
    final statusValue = map['status'] as String? ?? 'active';
    TodoTaskStatus status;
    switch (statusValue) {
      case 'done':
        status = TodoTaskStatus.done;
        break;
      case 'deleted':
        status = TodoTaskStatus.deleted;
        break;
      default:
        status = TodoTaskStatus.active;
    }

    return TodoTask(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      status: status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.name,
    };
  }
}
