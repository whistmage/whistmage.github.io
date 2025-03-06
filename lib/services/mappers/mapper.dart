import 'package:sandbox/entities/exceptions/mapper_exception.dart';
import 'dart:developer' as dev;

abstract class Mapper<From, In> {
  In mapModel(From dto);

  List<In> mapList(
    List<From> dtoModels, {
    bool needSkipMapException = true,
  }) {
    final List<In> domainModels = [];
    for (final dtoModel in dtoModels) {
      try {
        final domainModel = mapModel(dtoModel);
        domainModels.add(domainModel);
      } on MapperException catch (exception) {
        dev.log(exception.toString());
        if (!needSkipMapException) rethrow;
      }
    }
    return domainModels;
  }
}
