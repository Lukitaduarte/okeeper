import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../foundation/domain/models/result.dart';
import '../../../domain/repositories/login_repository.dart';
import '../../../domain/use_cases/authenticate_user_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginRepository loginRepository)
      : _loginRepository = loginRepository,
        super(LoginInitial());

  final LoginRepository _loginRepository;

  void authenticate({
    required String username,
    required String password,
  }) async {
    emit(LoginInProgress());

    final loginUseCase =
        AuthenticateUserUseCase(loginRepository: _loginRepository);
    final result = await loginUseCase.execute({
      'username': username,
      'password': password,
    });

    if (result is ResultSuccess) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }
}
