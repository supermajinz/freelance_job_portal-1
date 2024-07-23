import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure({required String errMessage, this.statusCode})
      : super(errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: 'Send timeout in connection with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: 'Receive timeout in connection with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to API server was cancelled');
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return ServerFailure(errMessage: 'No Internet connection');
        }
        return ServerFailure(errMessage: 'Unexpected error occurred');

      default:
        {
          print(dioException.error);
          print(dioException.message);
          print(dioException.toString());

          return ServerFailure(errMessage: 'Oops, something went wrong');
        }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    statusCode = statusCode ?? 0;
    String message = 'Unknown error occurred';

    if (response is Map<String, dynamic>) {
      message = response['message'] ?? response['error']?['message'] ?? message;
    } else if (response is String) {
      message = response;
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(errMessage: message, statusCode: statusCode);
      case 401:
        return ServerFailure(
            errMessage: 'Unauthorized: $message', statusCode: statusCode);
      case 403:
        return ServerFailure(
            errMessage: 'Forbidden: $message', statusCode: statusCode);
      case 404:
        return ServerFailure(
            errMessage: 'Not found: $message', statusCode: statusCode);
      case 500:
        return ServerFailure(
            errMessage: 'Internal server error: $message',
            statusCode: statusCode);
      default:
        return ServerFailure(errMessage: message, statusCode: statusCode);
    }
  }
}
