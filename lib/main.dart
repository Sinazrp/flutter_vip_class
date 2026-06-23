import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_router.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_routes.dart';
import 'ui/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Teaching App',
      theme: AppTheme.lightTheme,
<<<<<<< HEAD
      initialRoute: AppRoutes.profile,
      //routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
      //home: ProfilePage(),
=======
      initialRoute: AppRoutes.signIn,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
>>>>>>> 28820f424d9e1491430498071fce6a6d98b27bf6
      debugShowCheckedModeBanner: false,
    );
  }
}
