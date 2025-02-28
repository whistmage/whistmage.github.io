import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/ui/appereance/app_theme.dart';
import 'package:sandbox/ui/common/app_theme_observer/app_theme_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeObserver(
      builder: (context, themeMode) => MaterialApp.router(
        title: 'Sandbox',
        themeMode: themeMode,
        theme: getIt.get<AppTheme>().light,
        darkTheme: getIt.get<AppTheme>().dark,
        routerConfig: getIt.get<GoRouter>(),
      ),
    );
  }
}
