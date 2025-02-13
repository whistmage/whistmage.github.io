import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sandbox/data/dto/career_node_data.dart';

part 'career_nodes_api_client.g.dart';

@RestApi()
@LazySingleton()
abstract class CareerNodeApiClient {
  @factoryMethod
  factory CareerNodeApiClient(Dio dio) = _CareerNodeApiClient;

  @GET('/careerNodes.json')
  Future<List<CareerNodeData>> getCareerNodes();
}
