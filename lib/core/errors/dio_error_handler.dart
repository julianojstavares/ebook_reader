import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleError(DioException error) {
    const prefix = "[DioError] ";

    switch (error.type) {
      case DioExceptionType.badCertificate:
        return "$prefix Bad Certificate";
      case DioExceptionType.badResponse:
        return handleBadResponse(prefix, error);
      case DioExceptionType.cancel:
        return "$prefix Canceled";
      case DioExceptionType.connectionError:
        return "$prefix Connection Error \n ${error.error}";
      case DioExceptionType.connectionTimeout:
        return "$prefix Connection Timeout";
      case DioExceptionType.receiveTimeout:
        return "$prefix Receive Timeout";
      case DioExceptionType.sendTimeout:
        return "$prefix Send Timeout";
      case DioExceptionType.unknown:
        return "$prefix Unknown Error";
      default:
        return "Unknown Error - No Dio Exception Type";
    }
  }

  static String handleBadResponse(String prefix, DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode != null) {
      final defaultMsg =
          "$prefix Bad Response \n Status Code: ${error.response?.statusCode} \n ";

      switch (statusCode) {
        case 400:
          return "$defaultMsg ${error.response?.data["error"]["message"]}";
        default:
          return defaultMsg;
      }
    }

    return "$prefix Bad Response";
  }
}
