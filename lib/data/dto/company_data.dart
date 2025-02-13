import 'package:json_annotation/json_annotation.dart';

part 'company_data.g.dart';

@JsonSerializable(createToJson: false)
class CompanyData {
  String? description;
  String? name;
  String? link;

  CompanyData({this.description, this.name});

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);
}
