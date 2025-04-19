import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/di/injector.dart';
import 'core/navigation/app_router.dart';

void main() {
  Injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
