class MapperException implements Exception {
  MapperException({required this.reason});

  MapperException.someRequiredFieldIsNullOrIncorrectType(
    Object mappedData,
    Error exception,
  ) : reason =
            '''Required field is null or incorrect type: ${mappedData.toString()}.
             Original error: ${exception.toString()}''';

  MapperException.unknowEnumType(String type)
      : reason = '''Unknow "$type" enum type.''';

  final String reason;

  @override
  String toString() => reason;
}
