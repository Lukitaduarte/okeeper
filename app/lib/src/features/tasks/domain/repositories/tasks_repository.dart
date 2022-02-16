import '../models/day.dart';

abstract class DaysRepository {
  List<Day> fetchDays({required startDate, required endDate});
}