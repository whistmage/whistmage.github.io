import 'package:flutter/material.dart';

class GradientBackgroundContainer extends StatelessWidget {
  const GradientBackgroundContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorScheme.primary, colorScheme.secondary],
        ),
      ),
      child: child,
    );
  }
}
