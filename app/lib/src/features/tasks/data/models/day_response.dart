import 'task_response.dart';

class DayResponse {
  final String date;
  final List<TaskResponse> tasks;

  DayResponse({
    required this.date,
    required this.tasks,
  });

  factory DayResponse.fromJson(Map<String, dynamic> json) => DayResponse(
        date: json['date'],
        tasks: (json['tasks'] as List)
            .map((task) => TaskResponse.fromJson(task))
            .toList(),
      );
}
