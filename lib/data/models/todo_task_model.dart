import '../../domain/models/todo_task.dart';

class TodoTaskModel extends TodoTask {
  TodoTaskModel({
    required super.id,
    required super.title,
    required super.description,
    super.status,
  });

  factory TodoTaskModel.fromMap(Map<String, dynamic> map) {
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

    return TodoTaskModel(
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
