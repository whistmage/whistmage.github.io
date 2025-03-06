import 'package:json_annotation/json_annotation.dart';

part 'company_data.g.dart';

@JsonSerializable(createToJson: false)
class CompanyData {
  CompanyData({this.name, this.link});

  final String? name;
  final String? link;

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);
}
