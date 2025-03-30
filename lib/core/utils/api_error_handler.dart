import 'package:dio/dio.dart';
import '../error/failures.dart';

class ApiErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return const ServerFailure(message: 'Unknown error occurred');
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(message: 'Connection timeout');
      case DioExceptionType.badCertificate:
        return const ServerFailure(message: 'Bad certificate');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request was cancelled');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      case DioExceptionType.unknown:
      default:
        return const ServerFailure(message: 'Something went wrong');
    }
  }

  static Failure _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    
    String message = 'Server error';
    
    if (data != null && data is Map<String, dynamic> && data.containsKey('message')) {
      message = data['message'];
    }
    
    switch (statusCode) {
      case 400:
        return ServerFailure(message: message, statusCode: statusCode);
      case 401:
        return ServerFailure(message: 'Unauthorized', statusCode: statusCode);
      case 403:
        return ServerFailure(message: 'Forbidden', statusCode: statusCode);
      case 404:
        return ServerFailure(message: 'Not found', statusCode: statusCode);
      case 500:
      case 501:
      case 502:
      case 503:
        return ServerFailure(message: 'Server error', statusCode: statusCode);
      default:
        return ServerFailure(message: message, statusCode: statusCode);
    }
  }
}