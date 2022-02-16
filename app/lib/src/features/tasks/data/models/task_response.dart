import '../../../../foundation/data/models/user_response.dart';

class TaskResponse {
  final int type;
  final String time;
  final String name;
  final String description;
  final List<UserResponse> peoples;

  const TaskResponse({
    required this.type,
    required this.time,
    required this.name,
    required this.description,
    required this.peoples,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        type: json['type'],
        time: json['time'],
        name: json['name'],
        description: json['description'],
        peoples: (json['peoples'] as List)
            .map((people) => UserResponse.fromJson(people))
            .toList(),
      );
}
