import 'package:json_annotation/json_annotation.dart';

part 'hobby_data.g.dart';

@JsonSerializable(createToJson: false)
class HobbyData {
  HobbyData({this.name});

  final String? name;

  factory HobbyData.fromJson(Map<String, dynamic> json) =>
      _$HobbyDataFromJson(json);
}
