import '../../../../../foundation/data/models/user_response.dart';

abstract class LoginRemoteDataSource {
  Future<UserResponse> authenticate({
    required String username,
    required String password,
  });
}
