import 'package:injectable/injectable.dart';
import 'package:sandbox/data/dto/company_data.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:sandbox/entities/exceptions/mapper_exception.dart';
import 'package:sandbox/services/mappers/mapper.dart';

@injectable
class CompanyMapper extends Mapper<CompanyData, Company> {
  @override
  Company mapModel(CompanyData data) {
    try {
      final dtoLink = data.link;
      Uri? domainLink;
      if (dtoLink != null) {
        domainLink = Uri.tryParse(dtoLink);
      }
      return Company(
        name: data.name!,
        link: domainLink,
      );
    } on TypeError catch (error) {
      throw MapperException.someRequiredFieldIsNullOrIncorrectType(data, error);
    }
  }
}
