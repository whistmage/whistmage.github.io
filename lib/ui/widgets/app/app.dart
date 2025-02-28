import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/domain/state_models/app_theme_mode_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<AppThemeModeState>(
            param1: Theme.of(context).brightness,
          ),
        ),
      ],
      child: BlocBuilder<AppThemeModeState, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          title: 'Sandbox',
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          routerConfig: getIt.get<GoRouter>(),
        ),
      ),
    );
  }
}
