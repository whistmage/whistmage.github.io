import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/services/use_cases/fetch_personal_info_case.dart';
import 'dart:developer' as dev;

@singleton
class PersonalDetailsCubit extends Cubit<String?> {
  PersonalDetailsCubit({
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
      emit(personalInfo.details);
    } catch (error) {
      dev.log(error.toString());
    }
  }
}
