import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/contact/contact.dart';
import 'package:sandbox/services/use_cases/fetch_contacts_case.dart';
import 'package:sandbox/services/use_cases/open_contact_case.dart';
import 'dart:developer' as dev;

@singleton
class ContactsCubit extends Cubit<List<Contact>> {
  ContactsCubit({
    required FetchContactsCase fetchContactsCase,
    required OpenContactCase openContactCase,
  })  : _fetchContactsCase = fetchContactsCase,
        _openContactCase = openContactCase,
        super([]) {
    _init();
  }

  final FetchContactsCase _fetchContactsCase;
  final OpenContactCase _openContactCase;

  Future<void> _init() async => _fetchContacts();

  Future<void> _fetchContacts() async {
    try {
      final contacts = await _fetchContactsCase.run();
      emit(contacts);
    } catch (error) {
      dev.log(error.toString());
      emit([]);
    }
  }

  Future<void> openContact(Contact contact) async {
    try {
      await _openContactCase.run(contact: contact);
    } catch (error) {
      dev.log(error.toString());
    }
  }
}
