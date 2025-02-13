import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _acceptHeaderKey = 'Accept';

@lazySingleton
class DioBuilder {
  Dio build({required String baseUrl}) {
    final dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.headers[_acceptHeaderKey] = 'application/json; charset=UTF-8';
    return dio;
  }
}
