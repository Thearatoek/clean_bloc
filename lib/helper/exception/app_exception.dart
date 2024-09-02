import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final DioException? dioError;

  ApiException({
    required this.message,
    this.statusCode,
    this.dioError,
  });

  factory ApiException.fromDioError(DioException dioError) {
    String message;
    int? statusCode;

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        statusCode = dioError.response?.statusCode;
        message = "Received invalid status code: $statusCode";
        break;
      case DioExceptionType.connectionError:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.unknown:
      default:
        message = "Unexpected error occurred";
        break;
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      dioError: dioError,
    );
  }

  @override
  String toString() => 'ApiException: $message (Status code: $statusCode)';
}
