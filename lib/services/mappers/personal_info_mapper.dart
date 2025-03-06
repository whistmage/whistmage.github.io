import 'package:injectable/injectable.dart';
import 'package:sandbox/data/dto/personal_info_data.dart';
import 'package:sandbox/entities/personal_info/personal_info.dart';
import 'package:sandbox/entities/exceptions/mapper_exception.dart';

@injectable
class PersonalInfoMapper {
  PersonalInfo mapModel(PersonalInfoData data) {
    try {
      return PersonalInfo(
        name: data.name!,
        surname: data.surname!,
        details: data.details!,
        position: data.position!,
      );
    } on TypeError catch (error) {
      throw MapperException.someRequiredFieldIsNullOrIncorrectType(data, error);
    }
  }
}
