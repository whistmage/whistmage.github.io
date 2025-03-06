import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/career/experience_duration.dart';

@Injectable()
class ExperienceDurationMapper {
  ExperienceDuration mapModel(
    DateTime start,
    DateTime finish, {
    bool roundLastMonths = true,
  }) {
    const monthsPerYear = DateTime.monthsPerYear;
    final yearsDiff = finish.year - start.year;
    var totalMonths = yearsDiff * monthsPerYear - start.month + finish.month;
    if (roundLastMonths) totalMonths++;
    final int yearsCount = (totalMonths / monthsPerYear).truncate();
    final monthsCount = totalMonths - yearsCount * DateTime.monthsPerYear;
    return ExperienceDuration(months: monthsCount, years: yearsCount);
  }
}
