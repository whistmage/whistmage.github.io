import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/services/model_states/app_theme_mode/app_theme_mode_cubit.dart';

class AppThemeObserver extends StatelessWidget {
  const AppThemeObserver({super.key, required this.builder});

  final Widget Function(BuildContext, ThemeMode) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppThemeModeCubit>(
        param1: Theme.of(context).brightness,
      ),
      child: BlocBuilder<AppThemeModeCubit, ThemeMode>(builder: builder),
    );
  }
}
