import 'package:flutter/material.dart';

class PageSectionHeader extends StatelessWidget {
  const PageSectionHeader({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.only(left: 14, right: 14, top: 14),
  });

  final String title;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surfaceTint;
    return Row(
      children: [
        Container(
          height: 24,
          width: 154,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(child: Container(height: 1, color: backgroundColor))
      ],
    );
  }
}
