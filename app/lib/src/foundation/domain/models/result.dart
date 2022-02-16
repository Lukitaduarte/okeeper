abstract class Result {}

class ResultSuccess<T> implements Result {
  final T data;
  const ResultSuccess({required this.data});
}

class ResultFailure<T extends Exception> implements Result {
  final Exception error;
  ResultFailure({required this.error});
}
