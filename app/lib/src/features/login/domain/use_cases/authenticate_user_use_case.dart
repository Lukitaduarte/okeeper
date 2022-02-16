import '../repositories/login_repository.dart';
import '../../../../foundation/domain/models/result.dart';
import '../../../../foundation/domain/use_cases/use_case.dart';
import '../../../../foundation/domain/models/user.dart';

class AuthenticateUserUseCase implements UseCase {
  const AuthenticateUserUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;

  @override
  Future<Result> execute(Map<String, dynamic> params) async {
    try {
      final user = await _loginRepository.authenticate(
        username: params['username'],
        password: params['password'],
      );

      return ResultSuccess<User>(data: user);
    } on Exception catch (exception) {
      return ResultFailure(error: exception);
    }
  }
}
