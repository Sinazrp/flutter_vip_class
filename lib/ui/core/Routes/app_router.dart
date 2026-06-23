import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/features/profile/views/profile_page.dart';
import 'package:flutter_vip_class/ui/features/sign_in/views/sign_in.dart';
import 'app_routes.dart';
import '../../features/tasks/views/deleted_tasks_page.dart';
import '../../features/tasks/views/done_tasks_page.dart';
import '../../features/tasks/views/task_list_page.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.signIn: (context) => const SignInPage(),
    AppRoutes.tasks: (context) => const TaskListPage(),
    AppRoutes.doneTasks: (context) => const DoneTasksPage(),
    AppRoutes.deletedTasks: (context) => const DeletedTasksPage(),
    AppRoutes.profilePage: (context) => const ProfilePage(),
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
