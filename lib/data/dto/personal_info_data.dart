import 'package:json_annotation/json_annotation.dart';

part 'personal_info_data.g.dart';

@JsonSerializable(createToJson: false)
class PersonalInfoData {
  PersonalInfoData({
    this.details,
    this.name,
    this.surname,
    this.position,
  });

  final String? details;
  final String? name;
  final String? surname;
  final String? position;

  factory PersonalInfoData.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoDataFromJson(json);
}
