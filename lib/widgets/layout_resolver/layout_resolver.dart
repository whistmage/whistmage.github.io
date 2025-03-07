import 'package:flutter/material.dart';
import 'package:sandbox/widgets/layout_resolver/compact_page_layout.dart';
import 'package:sandbox/widgets/layout_resolver/expanded_page_layout.dart';

class LayoutResolver extends StatelessWidget {
  const LayoutResolver({
    super.key,
    required this.pageTitle,
    required this.child,
  });

  final String pageTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const compactLayoutMaxWidth = 600;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompactLayout = screenWidth < compactLayoutMaxWidth;
    if (isCompactLayout) {
      return CompactPageLayout(title: pageTitle, child: child);
    }
    return ExpandedPageLayout(title: pageTitle, child: child);
  }
}
