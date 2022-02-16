import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../foundation/data/models/user_response.dart';
import '../../../../tasks/domain/exceptions/unauthorized_exception.dart';
import '../../../../tasks/domain/exceptions/network_exception.dart';
import 'login_remote_data_source.dart';

class LoginApiDataSource implements LoginRemoteDataSource {
  static const String _path = '/login';

  const LoginApiDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<UserResponse> authenticate({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(_path, data: {
        'username': username,
        'password': password,
      });

      return UserResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        throw UnauthorizedException();
      } else {
        throw NetworkException();
      }
    }
  }
}
