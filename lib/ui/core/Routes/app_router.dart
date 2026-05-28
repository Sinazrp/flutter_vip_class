import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/profile/views/profile_page.dart';
import '../../features/tasks/views/deleted_tasks_page.dart';
import '../../features/tasks/views/done_tasks_page.dart';
import '../../features/tasks/views/task_list_page.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.profile: (context) => const ProfilePage(),
    AppRoutes.tasks: (context) => const TaskListPage(),
    AppRoutes.doneTasks: (context) => const DoneTasksPage(),
    AppRoutes.deletedTasks: (context) => const DeletedTasksPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (routes.containsKey(settings.name)) {
      return MaterialPageRoute(
        builder: routes[settings.name]!,
        settings: settings,
      );
    }
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('Route not found'))),
    );
  }
}
