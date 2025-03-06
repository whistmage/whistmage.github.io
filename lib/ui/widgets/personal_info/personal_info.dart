import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/services/model_states/personal_info/personal_info_cubit.dart';
import 'package:sandbox/ui/appereance/additional_colors.dart';
import 'package:sandbox/ui/widgets/avatar/avatar.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, this.padding = const EdgeInsets.all(14)});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final personalInfo = context.watch<PersonalInfoCubit>().state;
    if (personalInfo == null) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }
    final positionTextColor =
        Theme.of(context).extension<AdditionalColors>()?.minorHeaderColor;
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Avatar(),
            SizedBox(height: 8),
            Text(
              '${personalInfo.name} ${personalInfo.surname}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 4),
            Text(
              personalInfo.position,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: positionTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
