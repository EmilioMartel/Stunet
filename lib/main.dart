import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stunet/config/router/app_router.dart';
import 'package:stunet/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  
  runApp(
    const ProviderScope(child: MainApp())
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme()
    );
  }
}
