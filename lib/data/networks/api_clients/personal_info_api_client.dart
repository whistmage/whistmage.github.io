import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sandbox/data/dto/personal_info_data.dart';

part 'personal_info_api_client.g.dart';

@RestApi()
@LazySingleton()
abstract class PersonalInfoApiClient {
  @factoryMethod
  factory PersonalInfoApiClient(Dio dio) = _PersonalInfoApiClient;

  @GET('/aboutMe.json')
  Future<PersonalInfoData> getPersonalInfo();
}
