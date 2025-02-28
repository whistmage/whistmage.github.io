import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/domain/state_models/app_theme_mode_state.dart';

class AppThemeObserver extends StatelessWidget {
  const AppThemeObserver({super.key, required this.builder});

  final Widget Function(BuildContext, ThemeMode) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppThemeModeState>(
        param1: Theme.of(context).brightness,
      ),
      child: BlocBuilder<AppThemeModeState, ThemeMode>(builder: builder),
    );
  }
}
