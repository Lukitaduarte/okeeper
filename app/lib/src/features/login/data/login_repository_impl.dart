import '../../../foundation/domain/models/user.dart';
import '../domain/repositories/login_repository.dart';
import 'data_sources/remote/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(LoginRemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  final LoginRemoteDataSource _remoteDataSource;

  @override
  Future<User> authenticate({
    required String username,
    required String password,
  }) async {
    try {
      final userResponse = await _remoteDataSource.authenticate(
            username: username,
            password: password,
          );

      // todo: create mappers later.
      return User(
        id: userResponse.id,
        name: userResponse.name,
      );
    } catch (_) {
      rethrow;
    }
  }
}
