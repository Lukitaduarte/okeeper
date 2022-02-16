class UserResponse {
  final int id;
  final String name;

  const UserResponse({
    required this.id,
    required this.name,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json['id'],
        name: json['name'],
      );
}
