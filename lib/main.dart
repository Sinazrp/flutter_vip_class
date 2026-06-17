import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_router.dart';
import 'package:flutter_vip_class/ui/core/Routes/app_routes.dart';
import 'package:flutter_vip_class/ui/core/theme/app_theme.dart';
import 'package:flutter_vip_class/data/services/local_storage_service.dart';
import 'package:flutter_vip_class/data/repositories/user_repository.dart';
import 'package:flutter_vip_class/ui/features/profile/providers/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  final storageService = await LocalStorageService.getInstance();

  // Initialize repositories
  final userRepository = UserRepository(storageService);

  runApp(
    MultiProvider(
      providers: [
        // Repositories (using Provider - won't change)
        Provider<UserRepository>.value(value: userRepository),

        // State Providers (using ChangeNotifierProvider)
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(userRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Teaching App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.profile,
      //routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
      //home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
