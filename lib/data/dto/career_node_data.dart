import 'package:json_annotation/json_annotation.dart';
import 'package:sandbox/data/dto/company_data.dart';

part 'career_node_data.g.dart';

@JsonSerializable(createToJson: false)
class CareerNodeData {
  CareerNodeData({
    this.company,
    this.details,
    this.finishDate,
    this.jobtTitle,
    this.skills,
    this.startDate,
  });

  final CompanyData? company;
  final String? details;
  final int? finishDate;
  final String? jobtTitle;
  final List<String>? skills;
  final int? startDate;

  factory CareerNodeData.fromJson(Map<String, dynamic> json) =>
      _$CareerNodeDataFromJson(json);
}
