import 'package:flutter/material.dart';
import 'package:sandbox/ui/widgets/checkout_theme_mode_button/checkout_theme_mode_button.dart';
import 'package:sandbox/ui/widgets/side_bar/side_bar.dart';

class CompactPageLayout extends StatelessWidget {
  const CompactPageLayout({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [CheckoutThemeModeButton()],
          title: Text(title),
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: SideBar(),
        ),
        body: child,
      ),
    );
  }
}
