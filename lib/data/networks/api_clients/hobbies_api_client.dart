import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sandbox/data/dto/hobby_data.dart';

part 'hobbies_api_client.g.dart';

@RestApi()
@LazySingleton()
abstract class HobbiesApiClient {
  @factoryMethod
  factory HobbiesApiClient(Dio dio) = _HobbiesApiClient;

  @GET('/hobbies.json')
  Future<List<HobbyData>> getHobbies();
}
