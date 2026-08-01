import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/error_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorHandler.initialize();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// removed placeholder LobbyScreen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.darkTheme, // Enforcing dark theme for now
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
