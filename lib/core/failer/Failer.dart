import 'package:dio/dio.dart';

class Failer {
  String ? error;
  Failer(this.error);
}
class ApiFailure extends Failer {
  ApiFailure(super.error);

  factory ApiFailure.fromTypeError(DioException dioException) {
    final data = dioException.response?.data;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiFailure('Connection timed out. Please try again.');
      case DioExceptionType.badCertificate:
        return ApiFailure('Untrusted certificate. Check your connection.');
      case DioExceptionType.badResponse:
        if (data is Map) {
          return ApiFailure.fromBadResponse(
              dioException.response!.statusCode!, data);
        } else if (data is String) {
          return ApiFailure(
              "Server error ${dioException.response?.statusCode}: $data");
        } else {
          return ApiFailure(
              "Unexpected error format: ${dioException.response?.statusCode}");
        }
      case DioExceptionType.cancel:
        return ApiFailure("Request was cancelled.");
      case DioExceptionType.connectionError:
        return ApiFailure("No internet connection.");
      case DioExceptionType.unknown:
      default:
        return ApiFailure("Unexpected error: ${dioException.message}");
    }
  }

  factory ApiFailure.fromBadResponse(int statusCode, Map response)
  {
    if (statusCode == 400) {
      return ApiFailure(
          "Bad Request – The server could not understand the request.");
    } else if (statusCode == 401) {
      return ApiFailure("Unauthorized – Please log in.");
    } else if (statusCode == 403) {
      return ApiFailure("Forbidden – You don’t have permission.");
    } else if (statusCode == 404) {
      return ApiFailure("Not Found – The resource doesn’t exist.");
    } else if (statusCode == 405) {
      return ApiFailure("Method Not Allowed – Invalid method.");
    } else if (statusCode == 408) {
      return ApiFailure("Request Timeout – Try again later.");
    } else if (statusCode == 422) {
      return ApiFailure("Validation error – Check your input.");
    } else if (statusCode == 429) {
      return ApiFailure("Too Many Requests – Please slow down.");
    } else if (statusCode == 500) {
      return ApiFailure("Internal Server Error – Something went wrong.");
    } else if (statusCode == 502) {
      return ApiFailure("Bad Gateway – Invalid server response.");
    } else if (statusCode == 503) {
      return ApiFailure("Service Unavailable – Try again later.");
    } else if (statusCode == 504) {
      return ApiFailure("Gateway Timeout – Server took too long.");
    } else {
      return ApiFailure("Server error [$statusCode]: 'Unknown error'}");
    }
  }
}