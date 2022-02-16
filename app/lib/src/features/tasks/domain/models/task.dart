import '../../../../foundation/domain/models/user.dart';

class Task {
  final int type;
  final String time;
  final String name;
  final String description;
  final List<User> peoples;

  Task({
    required this.type,
    required this.time,
    required this.name,
    required this.description,
    required this.peoples,
  });
}
