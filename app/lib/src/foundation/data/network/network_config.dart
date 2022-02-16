import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../environments/environment.dart';

class NetworkConfig {
  static final Dio? _instance = null;

  static Dio providesDioInstance(Environment environment) {
    return _instance ??
        Dio(BaseOptions(
          baseUrl: environment.baseUrl,
          headers: _getHeaders(environment),
        ));
  }

  static Map<String, String> _getHeaders(Environment environment) =>
      {HttpHeaders.authorizationHeader: 'Basic ${_getCredential(environment)}'};

  static String _getCredential(Environment environment) =>
      base64.encode(utf8.encode(
        '${environment.basicClientId}:${{environment.basicClientSecret}}',
      ));
}
