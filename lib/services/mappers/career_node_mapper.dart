import 'package:injectable/injectable.dart';
import 'package:sandbox/data/dto/career_node_data.dart';
import 'package:sandbox/entities/career/career_node.dart';
import 'package:sandbox/entities/exceptions/mapper_exception.dart';
import 'package:sandbox/services/mappers/company_mapper.dart';
import 'package:sandbox/services/mappers/experience_duration_mapper.dart';
import 'package:sandbox/services/mappers/mapper.dart';

@injectable
class CareerNodeMapper extends Mapper<CareerNodeData, CareerNode> {
  CareerNodeMapper({
    required CompanyMapper companyMapper,
    required ExperienceDurationMapper experienceDurationMapper,
  })  : _companyMapper = companyMapper,
        _experienceDurationMapper = experienceDurationMapper;

  final CompanyMapper _companyMapper;
  final ExperienceDurationMapper _experienceDurationMapper;

  @override
  CareerNode mapModel(CareerNodeData data) {
    try {
      final startDate =
          DateTime.fromMillisecondsSinceEpoch(data.startDate! * 1000);
      final finishDate = data.finishDate != null
          ? DateTime.fromMillisecondsSinceEpoch(data.finishDate! * 1000)
          : null;
      return CareerNode(
        company: _companyMapper.mapModel(data.company!),
        details: data.details!,
        jobtTitle: data.jobtTitle!,
        startDate: startDate,
        finishDate: finishDate,
        experienceDuration: _experienceDurationMapper.mapModel(
          startDate,
          finishDate ?? DateTime.now(),
        ),
      );
    } on TypeError catch (error) {
      throw MapperException.someRequiredFieldIsNullOrIncorrectType(data, error);
    }
  }
}
