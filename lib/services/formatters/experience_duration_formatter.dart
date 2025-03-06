import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sandbox/entities/career/experience_duration.dart';

@Injectable()
class ExperienceDurationFormatter {
  String format({
    required ExperienceDuration duration,
  }) {
    final formattedYears = _formateYearsByCount(duration.years);
    final formattedMonts = _formateMonthsByCount(duration.months);
    if (formattedMonts != null && formattedYears != null) {
      return '$formattedYears, $formattedMonts';
    }
    if (formattedMonts != null) return formattedMonts;
    if (formattedYears != null) return formattedYears;
    throw Error();
  }

  String? _formateMonthsByCount(int count) {
    if (count == 0) return null;
    final plural = Intl.plural(
      count,
      locale: 'ru',
      one: 'месяц',
      few: 'месяца',
      other: 'месяцев',
    );
    return '$count $plural';
  }

  String? _formateYearsByCount(int count) {
    if (count == 0) return null;
    final plural = Intl.plural(
      count,
      locale: 'ru',
      one: 'год',
      few: 'года',
      other: 'лет',
    );
    return '$count $plural';
  }
}
