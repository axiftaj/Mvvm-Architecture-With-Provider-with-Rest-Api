

class AppException implements Exception {

   String message = '';
   String prefix = '' ;

   AppException([this.message = '' , this.prefix = '']);

  @override
  String toString(){
    return '$prefix$message' ;
  }

}


class FetchDataException extends AppException {

  FetchDataException([String? message]) : super(message!, 'Error During Communication');
}


class BadRequestException extends AppException {

  BadRequestException([String? message]) : super(message!, 'Invalid request');
}


class UnauthorisedException extends AppException {

  UnauthorisedException([String? message]) : super(message!, 'Unauthorised request');
}


class InvalidInputException extends AppException {

  InvalidInputException([String? message]) : super(message!, 'Invalid Input');
}
