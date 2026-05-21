import 'package:flutter_vip_class/playground/work_task.dart';

class Task {
  //instance level Field
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;
  final DateTime? dueDate;
  final int
  _priority; // encapulated field (private field) that can only be accessed within the class

  // a Task(this.title, this.description, this.isCompleted, this.createdAt);

  const Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
    this.dueDate,
    int priority = 0,
  }) : _priority = priority;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // Class Level Field
  static const String hint =
      " this is just a test field to show class Level fields ";
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // named constructor
  Task.urgent({required this.description})
    : isCompleted = false,
      completedAt = null,
      createdAt = DateTime.now(),
      dueDate = DateTime.now().add(const Duration(days: 1)),
      _priority = 1,
      title = "urgent Task";
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // copy with
  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? dueDate,
  }) {
    return Task(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      completedAt: completedAt ?? this.completedAt,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // a getter that get data from the task and return a string
  String get data {
    return "Task Name is : $title and description is : $description, completed at : $completedAt";
  }
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  // overriding toString method to print the task details when we print the task object
  @override
  String toString() {
    return "Task Name is : $title and description is : $description, completed at : $completedAt";
  }
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  // a getter that check if the task is overdue or not
  bool get isOverDue {
    return dueDate!.isBefore(DateTime.now());
  }
  //! practice : implement it with arrow Operator

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  // a getter to get the priority of the task
  int get priority => _priority;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //

  List<Task> getFakeTaskList() {
    return [
      Task(
        title: "Task 1",
        description: "Description for Task 1",
        createdAt: DateTime.now(),
      ),
      Task(
        title: "Task 2",
        description: "Description for Task 2",
        createdAt: DateTime.now(),
      ),
      Task(
        title: "Task 3",
        description: "Description for Task 3",
        createdAt: DateTime.now(),
      ),
    ];
  }

  //! practice : implement it with arrow Operator and get
}

void main() {
  // 1 Task task1 = Task(
  //   "teaching",
  //   " teaching ilia about constructors",
  //   false,
  //   DateTime.now(),
  // );

  Task task_1 = Task(
    // isCompleted: true,
    description: "learn constructor",
    title: " teacging",
    createdAt: DateTime.now(),
  );

  Task urgentTask = Task.urgent(description: 'Learn named constructor');

  task_1 = task_1.copyWith(title: "edited");

  List<Task> tasks = task_1.getFakeTaskList();

  print(
    "Task Name is : ${task_1.title} and description is : ${task_1.description}, completed at : ${task_1.completedAt}",
  );

  print(urgentTask.data);
  print(urgentTask.isOverDue);
  print(urgentTask.toString());
  print(tasks);

  print(Task.hint);

  for (var task in tasks) {
    print(task._priority);
    //why we can access the private field
  }

  WorkTask workTask = WorkTask(
    title: 'Defend',
    createdAt: DateTime.now(),
    projectCode: 'delta',
  );
  workTask.shareTask('defend');

  // ilia should create a list of base tasks
}
