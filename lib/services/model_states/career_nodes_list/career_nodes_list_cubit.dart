import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/services/model_states/career_nodes_list/career_nodes_list_state.dart';
import 'package:sandbox/services/use_cases/fetch_career_nodes_case.dart';

@injectable
class CareerNodesCubit extends Cubit<CareerNodesState> {
  CareerNodesCubit({
    required FetchCareerNodesCase fetchCareerNodesCase,
  })  : _fetchCareerNodesCase = fetchCareerNodesCase,
        super(CareerNodesInitial()) {
    _init();
  }

  final FetchCareerNodesCase _fetchCareerNodesCase;

  Future<void> _init() async => _fetchCareerNodes();

  Future<void> _fetchCareerNodes() async {
    try {
      emit(CareerNodesLoadInProgess());
      final careerNodes = await _fetchCareerNodesCase.run();
      emit(CareerNodesLoadFinish(values: careerNodes));
    } catch (error) {
      dev.log(error.toString());
      emit(CareerNodesFailure());
    }
  }
}
