import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lints_localization_assignment9/core/di/injector.dart';
import 'core/navigation/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),

        // 👇 Localization added below
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('hi'),
          Locale('es'),
        ],
        locale: const Locale('en'),
      );
}
