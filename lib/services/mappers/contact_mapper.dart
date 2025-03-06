import 'package:injectable/injectable.dart';
import 'package:sandbox/data/dto/contact_data.dart';
import 'package:sandbox/entities/contact/contact.dart';
import 'package:sandbox/entities/exceptions/mapper_exception.dart';
import 'package:sandbox/services/mappers/mapper.dart';

@injectable
class ContactMapper extends Mapper<ContactData, Contact> {
  ContactMapper();

  static const _emailContactType = 'email';
  static const _githubContactType = 'github';
  static const _telegramContactType = 'telegram';

  @override
  Contact mapModel(ContactData data) {
    try {
      switch (data.type) {
        case _emailContactType:
          return EmailContact(address: data.value!);
        case _githubContactType:
          return GithubContact(link: data.value!);
        case _telegramContactType:
          return TelegramContact(link: data.value!);
        default:
          throw MapperException.unknowEnumType(data.type!);
      }
    } on TypeError catch (error) {
      throw MapperException.someRequiredFieldIsNullOrIncorrectType(data, error);
    }
  }
}
