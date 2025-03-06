import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sandbox/data/dto/contact_data.dart';

part 'contacts_api_client.g.dart';

@RestApi()
@LazySingleton()
abstract class ContactsApiClient {
  @factoryMethod
  factory ContactsApiClient(Dio dio) = _ContactsApiClient;

  @GET('/contacts.json')
  Future<List<ContactData>> getContacts();
}
