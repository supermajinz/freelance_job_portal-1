import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with Apiserver");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with Apiserver");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with Apiserver");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to Apiserver with cancel");
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try agine.....');
      default:
        return ServerFailure('Opps there was an error,please try agine......');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Method not found,please try later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error,please try later");
    } else {
      return ServerFailure("Opps there was an error,please try agine");
    }
  }
}
