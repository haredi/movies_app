sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;
  Success({required this.data});
}

class ServerError<T> extends Result<T> {
  String statusMessage;
  num statusCode;
  bool success;
  ServerError(
      {required this.statusMessage,
      required this.statusCode,
      required this.success});
}

class Error<T> extends Result<T> {
  Exception exception;
  Error({required this.exception});
}
