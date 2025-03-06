import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/data/networks/api_clients/career_nodes_api_client.dart';
import 'package:sandbox/entities/career/career_node.dart';
import 'package:sandbox/entities/exceptions/network_exception.dart';
import 'package:sandbox/services/mappers/career_node_mapper.dart';

@injectable
class FetchCareerNodesCase {
  FetchCareerNodesCase({
    required CareerNodeApiClient apiClient,
    required CareerNodeMapper careerNodeMapper,
  })  : _apiClient = apiClient,
        _careerNodeMapper = careerNodeMapper;

  final CareerNodeApiClient _apiClient;
  final CareerNodeMapper _careerNodeMapper;

  Future<List<CareerNode>> run() async {
    try {
      final results = await _apiClient.getCareerNodes();
      return _careerNodeMapper.mapList(results);
    } on DioException catch (exception) {
      throw NetworkException.handleDioException(exception);
    }
  }
}
