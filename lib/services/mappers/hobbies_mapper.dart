import 'package:injectable/injectable.dart';
import 'package:sandbox/data/dto/hobby_data.dart';
import 'package:sandbox/entities/exceptions/mapper_exception.dart';
import 'package:sandbox/services/mappers/mapper.dart';

@injectable
class HobbiesMapper extends Mapper<HobbyData, String> {
  HobbiesMapper();

  @override
  String mapModel(HobbyData data) {
    try {
      return data.name!;
    } on TypeError catch (error) {
      throw MapperException.someRequiredFieldIsNullOrIncorrectType(data, error);
    }
  }
}
