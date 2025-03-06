import 'package:dio/dio.dart';

class NetworkException implements Exception {
  NetworkException({required this.reason});

  NetworkException.handleDioException(
    DioException exception,
  ) : reason = '''Some network error, code: ${exception.response?.statusCode},
             details: ${exception.toString()}''';

  final String reason;

  @override
  String toString() => reason;
}
