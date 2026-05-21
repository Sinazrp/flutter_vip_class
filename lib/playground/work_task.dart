// 2. Inheritance
import 'package:flutter_vip_class/playground/abstract_base_task.dart';
import 'package:flutter_vip_class/playground/mixin.dart';

class WorkTask extends BaseTask with Shareable {
  final String projectCode;

  // Using 'super' to pass parameters to the parent class (BaseTask)
  WorkTask({
    required super.title,
    required super.createdAt,
    required this.projectCode,
  });

  // 3. Polymorphism (پلی‌مورفیسم / چندریختی)
  // Overriding the abstract method to provide specific behavior for WorkTask
  @override
  void printTaskDetails() {
    print("💼 [Work Task] Title: $title | Project Code: $projectCode");
  }
}

//  ilia create another child class that include bool isUrgent and
//override the printTaskDetails method to print the task details with the urgency status.
