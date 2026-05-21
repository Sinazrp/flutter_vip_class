// 1. Abstract Class
// We cannot create an object directly from an abstract class.
abstract class BaseTask {
  final String title;
  final DateTime createdAt;

  BaseTask({required this.title, required this.createdAt});

  // Abstract method
  // Every child class MUST implement this method.
  void printTaskDetails();

  // A normal method shared by all children
  bool isCreatedToday() {
    return DateTime.now().difference(createdAt).inDays == 0;
  }
}
