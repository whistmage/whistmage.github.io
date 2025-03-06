import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/data/networks/api_clients/personal_info_api_client.dart';
import 'package:sandbox/entities/personal_info/personal_info.dart';
import 'package:sandbox/entities/exceptions/network_exception.dart';
import 'package:sandbox/services/mappers/personal_info_mapper.dart';

@injectable
class FetchPersonalInfoCase {
  FetchPersonalInfoCase({
    required PersonalInfoApiClient apiClient,
    required PersonalInfoMapper careerNodeMapper,
  })  : _apiClient = apiClient,
        _careerNodeMapper = careerNodeMapper;

  final PersonalInfoApiClient _apiClient;
  final PersonalInfoMapper _careerNodeMapper;

  Future<PersonalInfo> run() async {
    try {
      final result = await _apiClient.getPersonalInfo();
      return _careerNodeMapper.mapModel(result);
    } on DioException catch (exception) {
      throw NetworkException.handleDioException(exception);
    }
  }
}
