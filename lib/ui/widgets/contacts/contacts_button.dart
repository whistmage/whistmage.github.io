import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox/entities/contact/contact.dart';
import 'package:sandbox/services/model_states/contacts/contacts_cubit.dart';

class ConctactButton extends StatelessWidget {
  const ConctactButton({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final String title;
    switch (contact) {
      case TelegramContact():
        title = 'Telegram';
      case EmailContact():
        title = 'Email';
      case GithubContact():
        title = 'Github';
    }
    return TextButton(
      onPressed: () => context.read<ContactsCubit>().openContact(contact),
      child: Text(title),
    );
  }
}
