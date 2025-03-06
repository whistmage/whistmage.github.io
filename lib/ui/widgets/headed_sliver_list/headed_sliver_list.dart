import 'package:flutter/widgets.dart';

class HeadedSliverList extends StatelessWidget {
  const HeadedSliverList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.headerBuilder,
    this.separatorBuilder,
    this.listDecoration = const BoxDecoration(),
    this.padding = EdgeInsets.zero,
  }) : itemsWithHeaderCount = itemCount + 1;

  final EdgeInsetsGeometry padding;
  final BoxDecoration listDecoration;
  final int itemsWithHeaderCount;
  final int itemCount;
  final Widget Function(BuildContext context) headerBuilder;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    const headerIndex = 0;
    return SliverPadding(
      padding: padding,
      sliver: DecoratedSliver(
        decoration: listDecoration,
        sliver: SliverList.separated(
          itemCount: itemsWithHeaderCount,
          separatorBuilder: (context, index) {
            final builder = separatorBuilder;
            if (builder != null) {
              return builder(context, index);
            }
            return const SizedBox.shrink();
          },
          itemBuilder: (context, index) {
            if (index == headerIndex) {
              return headerBuilder(context);
            }
            index -= 1;
            return itemBuilder(context, index);
          },
        ),
      ),
    );
  }
}
