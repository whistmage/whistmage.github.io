import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/widgets/app_theme/app_themes.dart';
import 'package:sandbox/widgets/app_theme/app_theme_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeObserver(
      builder: (context, themeMode) => MaterialApp.router(
        title: 'Sandbox',
        themeMode: themeMode,
        theme: getIt.get<AppThemes>().light,
        darkTheme: getIt.get<AppThemes>().dark,
        routerConfig: getIt.get<GoRouter>(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
