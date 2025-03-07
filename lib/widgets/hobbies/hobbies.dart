import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/widgets/hobbies/hobbies_cubit.dart';
import 'package:sandbox/widgets/app_theme/additional_colors.dart';
import 'package:sandbox/widgets/headed_sliver_list/headed_sliver_list.dart';

class Hobbies extends StatelessWidget {
  const Hobbies({
    super.key,
    this.padding = const EdgeInsets.all(14),
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final overlayColor =
        Theme.of(context).extension<AdditionalColors>()?.overlayColor;
    final hobbies = context.watch<HobbiesCubit>().state;
    if (hobbies == null || hobbies.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return HeadedSliverList(
      itemCount: hobbies.length,
      padding: padding,
      listDecoration: BoxDecoration(
        color: overlayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      headerBuilder: (_) => const _HobbiesHeader(),
      itemBuilder: (_, index) {
        final isFirstItem = index == 0;
        return _HobbyCard(
          title: hobbies[index],
          padding: EdgeInsets.fromLTRB(8, isFirstItem ? 4 : 0, 4, 4),
        );
      },
    );
  }
}

class _HobbiesHeader extends StatelessWidget {
  const _HobbiesHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 8),
      child: Text(
        'Хобби:',
        style: TextTheme.of(context).titleSmall,
      ),
    );
  }
}

class _HobbyCard extends StatelessWidget {
  const _HobbyCard({required this.title, required this.padding});

  final String title;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final color = Theme.of(context).colorScheme.onPrimary;
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 8, color: color),
          ),
          SizedBox(width: 2),
          Expanded(
            child: Text(
              title,
              style: textStyle?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
