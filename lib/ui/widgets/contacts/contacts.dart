import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/services/model_states/contacts/contacts_cubit.dart';
import 'package:sandbox/ui/widgets/contacts/contacts_button.dart';

class Contacts extends StatelessWidget {
  const Contacts({
    super.key,
    this.padding = const EdgeInsets.all(14),
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactsCubit>().state;
    if (contacts.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }
    return SliverPadding(
      padding: padding,
      sliver: SliverList.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return ConctactButton(contact: contacts[index]);
        },
      ),
    );
  }
}
