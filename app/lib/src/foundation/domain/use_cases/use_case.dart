import '../models/result.dart';

abstract class UseCase {
  Future<Result> execute(Map<String, dynamic> params);
}