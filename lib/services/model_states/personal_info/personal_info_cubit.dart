import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/personal_info/personal_info.dart';
import 'package:sandbox/services/use_cases/fetch_personal_info_case.dart';
import 'dart:developer' as dev;

@singleton
class PersonalInfoCubit extends Cubit<PersonalInfo?> {
  PersonalInfoCubit({
    required FetchPersonalInfoCase fetchPersonalInfoCase,
  })  : _fetchPersonalInfoCase = fetchPersonalInfoCase,
        super(null) {
    _init();
  }

  final FetchPersonalInfoCase _fetchPersonalInfoCase;

  Future<void> _init() async => _fetchPersonalInfo();

  Future<void> _fetchPersonalInfo() async {
    try {
      final personalInfo = await _fetchPersonalInfoCase.run();
      emit(personalInfo);
    } catch (error) {
      dev.log(error.toString());
    }
  }
}
