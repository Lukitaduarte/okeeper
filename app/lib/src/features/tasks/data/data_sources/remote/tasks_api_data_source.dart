import 'package:dio/dio.dart';

import '../../../domain/exceptions/network_exception.dart';
import '../../models/day_response.dart';
import 'tasks_remote_data_source.dart';

class TasksApiDataSource implements TasksRemoteDataSource {
  static const String _path = '/tasks';

  const TasksApiDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<DayResponse>> fetchDays({
    required startDate,
    required endDate,
  }) async {
    try {
      final response = await _dio.get(_path, queryParameters: {
        'startDate': startDate,
        'endDate': endDate,
      });

      return (response.data as List)
          .map((day) => DayResponse.fromJson(day))
          .toList();
    } on DioError catch (_) {
      throw NetworkException();
    }
  }
}
