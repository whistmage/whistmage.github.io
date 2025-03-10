import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/widgets/career_nodes/career_nodes_cubit.dart';
import 'package:sandbox/widgets/career_nodes/career_nodes_state.dart';
import 'package:sandbox/widgets/career_nodes/card/career_node_card.dart';
import 'package:sandbox/widgets/headed_sliver_list/headed_sliver_list.dart';
import 'package:sandbox/widgets/page_section_header/page_section_header.dart';

class CareerNodes extends StatelessWidget {
  const CareerNodes({
    super.key,
    this.padding = const EdgeInsets.all(14),
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CareerNodesCubit>().state;
    switch (state) {
      case CareerNodesLoadFinish():
        return HeadedSliverList(
            padding: padding,
            itemCount: state.values.length,
            headerBuilder: (_) => PageSectionHeader(title: 'Опыт'),
            itemBuilder: (context, index) {
              return CareerNodeCard(careerNode: state.values[index]);
            },
            separatorBuilder: (context, index) {
              if (index == 0) return SizedBox(height: 4);
              return Divider();
            });
      case CareerNodesLoadInProgess():
        return SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(child: LinearProgressIndicator()),
        );
      case CareerNodesInitial():
      case CareerNodesFailure():
        return SliverToBoxAdapter(child: SizedBox.shrink());
    }
  }
}
