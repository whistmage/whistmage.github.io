import 'package:flutter/material.dart';
import 'package:sandbox/widgets/app_theme/checkout_theme_mode_button.dart';
import 'package:sandbox/widgets/gradient_background_container/gradient_background_container.dart';
import 'package:sandbox/features/side_bar/side_bar.dart';

class ExpandedPageLayout extends StatelessWidget {
  const ExpandedPageLayout({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const sidePanelWidth = 300.0;
    return Scaffold(
      appBar: AppBar(
        actions: [CheckoutThemeModeButton()],
        title: Text(title),
      ),
      body: GradientBackgroundContainer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                SizedBox(
                  width: sidePanelWidth,
                  height: constraints.maxHeight,
                  child: SideBar(),
                ),
                SizedBox(
                  width: constraints.maxWidth - sidePanelWidth,
                  height: constraints.maxHeight,
                  child: child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
