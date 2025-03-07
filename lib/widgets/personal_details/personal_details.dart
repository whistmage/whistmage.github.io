import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/widgets/personal_details/personal_details_cubit.dart';
import 'package:sandbox/widgets/page_section_header/page_section_header.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    this.padding = const EdgeInsets.only(left: 14, right: 14, top: 14),
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final personalDetails = context.watch<PersonalDetailsCubit>().state;
    if (personalDetails == null) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            PageSectionHeader(title: 'Обо мне'),
            SizedBox(height: 10),
            Text(
              personalDetails,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
