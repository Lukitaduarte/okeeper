import 'environment.dart';

class Dev implements Environment {
  @override
  String baseUrl = 'https://demo7218230.mockable.io/';

  @override
  String basicClientId = 'username';

  @override
  String basicClientSecret = 'password';
}