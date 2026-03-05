import 'package:dio/dio.dart';
import 'package:eatamarna/generated/l10n.dart';

abstract class Failure {
  final String errorMessage;
  final bool isNoInternet;
  const Failure(this.errorMessage, {this.isNoInternet = false});
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, {super.isNoInternet});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.connectionTimeout, isNoInternet: true);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.receiveTimeout, isNoInternet: true);
      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.sendTimeout, isNoInternet: true);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(S.current.noInternetConnection, isNoInternet: true);
      case DioExceptionType.unknown:
        final errorMessage = dioException.message?.toLowerCase() ?? '';
        final errorString = dioException.error?.toString().toLowerCase() ?? '';

        if (errorMessage.contains('socketexception') ||
            errorMessage.contains('failed host lookup') ||
            errorMessage.contains('handshake_exception') ||
            errorMessage.contains('connection refused') ||
            errorString.contains('socketexception') ||
            errorString.contains('The connection errored') ||
            errorString.contains('failed host lookup')) {
          return ServerFailure(S.current.noInternetConnection, isNoInternet: true);
        }
        return ServerFailure(S.current.unexpectedError);
      default:
        return ServerFailure(S.current.defaultError);
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // 🔥 Handle business logic failure (status == 0)
    if (response is Map &&
        response['status'] == 0 &&
        response['message'] != null &&
        response['message'].toString().isNotEmpty) {
      print("here");
      return ServerFailure(response['message']);
    }

    // 🔥 Validation errors (Laravel style)
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {

      if (response['errors'] != null && response['errors'] is Map) {
        final errors = response['errors'] as Map<String, dynamic>;
        final firstError = errors.values.first;

        if (firstError is List && firstError.isNotEmpty) {
          return ServerFailure(firstError.first.toString());
        }
      }

      if (response['message'] != null &&
          response['message'].toString().isNotEmpty) {
        return ServerFailure(response['message']);
      }

      return ServerFailure(S.current.defaultError);
    }

    if (statusCode == 404) {
      return ServerFailure(S.current.requestNotFound);
    }

    if (statusCode == 500) {
      return ServerFailure(S.current.internalServerError);
    }

    return ServerFailure(S.current.defaultError);
  }

}
