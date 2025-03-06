import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/data/networks/api_clients/contacts_api_client.dart';
import 'package:sandbox/entities/contact/contact.dart';
import 'package:sandbox/entities/exceptions/network_exception.dart';
import 'package:sandbox/services/mappers/contact_mapper.dart';

@injectable
class FetchContactsCase {
  FetchContactsCase({
    required ContactsApiClient apiClient,
    required ContactMapper contactMapper,
  })  : _apiClient = apiClient,
        _contactMapper = contactMapper;

  final ContactsApiClient _apiClient;
  final ContactMapper _contactMapper;

  Future<List<Contact>> run() async {
    try {
      final results = await _apiClient.getContacts();
      return _contactMapper.mapList(results);
    } on DioException catch (exception) {
      throw NetworkException.handleDioException(exception);
    }
  }
}
