import 'package:flutter/material.dart';
import 'package:flutter_vip_class/ui/features/profile/views/profile_page.dart';
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
      // initialRoute: AppRoutes.profile,
      // routes: AppRouter.routes,
      // onGenerateRoute: AppRouter.onGenerateRoute,
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
