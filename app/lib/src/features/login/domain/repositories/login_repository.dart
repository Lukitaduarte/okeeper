import '../../../../foundation/domain/models/user.dart';

abstract class LoginRepository {
  Future<User> authenticate({
    required String username,
    required String password,
  });
}
