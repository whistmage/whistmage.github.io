import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:sandbox/services/model_states/career_nodes_list/career_nodes_list_cubit.dart';
import 'package:sandbox/ui/appereance/link_button_style_extension.dart';

class CompanyTitle extends StatelessWidget {
  const CompanyTitle({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    final linkButtonStyleExtension =
        Theme.of(context).extension<LinkButtonStyleExtension>();
    final link = company.link;
    final leftOffset = linkButtonStyleExtension?.padding.left ?? 0;
    return Transform.translate(
      offset: Offset(-leftOffset, 0.0),
      child: TextButton(
        style: linkButtonStyleExtension?.buttonStyle,
        onPressed: link == null
            ? null
            : () => context.read<CareerNodesCubit>().openCompany(company),
        child: Text(company.name),
      ),
    );
  }
}
