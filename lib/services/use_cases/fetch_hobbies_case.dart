import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/data/networks/api_clients/hobbies_api_client.dart';
import 'package:sandbox/entities/exceptions/network_exception.dart';
import 'package:sandbox/services/mappers/hobbies_mapper.dart';

@injectable
class FetchHobbiesCase {
  FetchHobbiesCase({
    required HobbiesApiClient apiClient,
    required HobbiesMapper hobbiesMapper,
  })  : _apiClient = apiClient,
        _hobbiesMapper = hobbiesMapper;

  final HobbiesApiClient _apiClient;
  final HobbiesMapper _hobbiesMapper;

  Future<List<String>> run() async {
    try {
      final results = await _apiClient.getHobbies();
      return _hobbiesMapper.mapList(results);
    } on DioException catch (exception) {
      throw NetworkException.handleDioException(exception);
    }
  }
}
