import '../../models/day_response.dart';

abstract class TasksRemoteDataSource {
  Future<List<DayResponse>> fetchDays({
    required String startDate,
    required String endDate,
  });
}
