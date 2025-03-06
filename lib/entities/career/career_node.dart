import 'package:sandbox/entities/career/company.dart';
import 'package:sandbox/entities/career/experience_duration.dart';

class CareerNode {
  CareerNode({
    required this.company,
    required this.details,
    required this.jobtTitle,
    required this.startDate,
    required this.finishDate,
    required this.experienceDuration,
  });

  final Company company;
  final String details;
  final String jobtTitle;
  final DateTime startDate;
  final DateTime? finishDate;
  final ExperienceDuration experienceDuration;
}
