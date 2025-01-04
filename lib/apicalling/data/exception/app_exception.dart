class AppException implements Exception {
  final message;
  final prefix;

  AppException({this.message, this.prefix});

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(message: 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException({String? message}) : super(message: 'Invalid Request');
}

class UnAuthorizeException extends AppException {
  UnAuthorizeException({String? message})
      : super(message: 'UnAuthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message}) : super(message: 'Invalid Input');
}
