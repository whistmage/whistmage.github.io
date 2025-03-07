import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:sandbox/services/model_states/career_nodes_list/career_nodes_list_state.dart';
import 'package:sandbox/services/use_cases/fetch_career_nodes_case.dart';
import 'package:sandbox/services/use_cases/open_company_case.dart';

@injectable
class CareerNodesCubit extends Cubit<CareerNodesState> {
  CareerNodesCubit({
    required FetchCareerNodesCase fetchCareerNodesCase,
    required OpenCompanyLinkCase openCompanyLinkCase,
  })  : _fetchCareerNodesCase = fetchCareerNodesCase,
        _openCompanyLinkCase = openCompanyLinkCase,
        super(CareerNodesInitial()) {
    _init();
  }

  final FetchCareerNodesCase _fetchCareerNodesCase;
  final OpenCompanyLinkCase _openCompanyLinkCase;

  Future<void> openCompany(Company company) async {
    try {
      await _openCompanyLinkCase.run(company: company);
    } catch (error) {
      dev.log(error.toString());
    }
  }

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
