import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sandbox/configuration/di.dart';
import 'package:sandbox/entities/career/career_node.dart';
import 'package:sandbox/services/formatters/experience_duration_formatter.dart';

class CareerNodeDuration extends StatelessWidget {
  CareerNodeDuration({super.key, required this.careerNode});

  final CareerNode careerNode;
  final _dateFormatter = DateFormat.yM('ru');
  final _durationFormatter = getIt.get<ExperienceDurationFormatter>();

  @override
  Widget build(BuildContext context) {
    final start = careerNode.startDate;
    final finish = careerNode.finishDate;
    String rangeText = toBeginningOfSentenceCase(_dateFormatter.format(start));
    if (finish != null) rangeText += ' - ${_dateFormatter.format(finish)}';
    final formattedDuration = _durationFormatter.format(
      duration: careerNode.experienceDuration,
    );
    return Text(
      '$rangeText, $formattedDuration',
      style: Theme.of(context).textTheme.bodySmall,
      // style: const TextStyle(color: Color(0xFF73808D), fontSize: 10),
    );
  }
}
