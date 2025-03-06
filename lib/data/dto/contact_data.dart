import 'package:json_annotation/json_annotation.dart';

part 'contact_data.g.dart';

@JsonSerializable(createToJson: false)
class ContactData {
  ContactData({
    this.value,
    this.type,
  });

  final String? type;
  final String? value;

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);
}
