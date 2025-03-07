import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/widgets/app_theme/app_theme_mode_cubit.dart';

class CheckoutThemeModeButton extends StatelessWidget {
  const CheckoutThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.read<AppThemeModeCubit>().checkoutMode,
      icon: Icon(
        Icons.dark_mode,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
