import 'package:flutter/material.dart';
import 'package:sandbox/domain/state_models/app_theme_mode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Resume',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: context.read<AppThemeModeState>().checkoutMode,
          child: Text('Change theme mode'),
        ),
      ),
    );
  }
}
