import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/services/model_states/hobbies/hobbies_cubit.dart';
import 'package:sandbox/ui/appereance/additional_colors.dart';
import 'package:sandbox/ui/widgets/headed_sliver_list/headed_sliver_list.dart';

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
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.fromLTRB(8, 4, 4, 0),
        child: _HobbyCard(
          title: hobbies[index],
        ),
      ),
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
  const _HobbyCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(
            Icons.circle,
            size: 8,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 2),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
