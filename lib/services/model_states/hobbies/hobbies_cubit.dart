import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/services/use_cases/fetch_hobbies_case.dart';
import 'dart:developer' as dev;

@singleton
class HobbiesCubit extends Cubit<List<String>?> {
  HobbiesCubit({
    required FetchHobbiesCase fetchHobbiesCase,
  })  : _fetchHobbiesCase = fetchHobbiesCase,
        super(null) {
    _init();
  }

  final FetchHobbiesCase _fetchHobbiesCase;

  Future<void> _init() async => _fetchPersonalInfo();

  Future<void> _fetchPersonalInfo() async {
    try {
      final hobbies = await _fetchHobbiesCase.run();
      emit(hobbies);
    } catch (error) {
      dev.log(error.toString());
    }
  }
}
