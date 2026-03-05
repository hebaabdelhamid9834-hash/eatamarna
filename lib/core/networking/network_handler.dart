import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eatamarna/core/constants/keys.dart';
import '../storage/preference_manager.dart';
import '../storage/secure_storage.dart';
import 'network-mappers.dart';
import 'network_response.dart';
import 'responses/error_response.dart';

class NetworkHandler {
  final Dio dio;
  final PreferenceManager preferenceManager;
  final String baseUrl;

  NetworkHandler({
    required this.preferenceManager,
    required this.dio,
    required this.baseUrl,
  });

  factory NetworkHandler.create(
    PreferenceManager preferenceManager,
    Dio dio,
    String baseUrl,
  ) {
    return NetworkHandler._internal(preferenceManager, dio, baseUrl);
  }

  NetworkHandler._internal(this.preferenceManager, this.dio, this.baseUrl);

  Future<NetworkResponse<ResponseType>> get<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _request(
      method: 'GET',
      responseType: responseType,
      url: url,
      queryParameters: queryParameters,
      body: body,
    );
  }

  Future<NetworkResponse<ResponseType>> post<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    dynamic body,
    dynamic encoding,
    Function(int, int)? onSendProgress,
  }) async {
    return _request(
      method: 'POST',
      responseType: responseType,
      url: url,
      body: body,
      encoding: encoding,
      onSendProgress: onSendProgress,
    );
  }

  Future<NetworkResponse<ResponseType>> put<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    dynamic body,
    dynamic encoding,
  }) async {
    return _request(
      method: 'PUT',
      responseType: responseType,
      url: url,
      body: body,
      encoding: encoding,
    );
  }

  Future<NetworkResponse<ResponseType>> update<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    dynamic body,
    dynamic encoding,
  }) async {
    return _request(
      method: 'PATCH',
      responseType: responseType,
      url: url,
      body: body,
      encoding: encoding,
    );
  }

  Future<NetworkResponse<ResponseType>> delete<ResponseType extends Mappable>(
    ResponseType responseType,
    String url, {
    dynamic body,
    dynamic encoding,
  }) async {
    return _request(
      method: 'DELETE',
      responseType: responseType,
      url: url,
      body: body,
      encoding: encoding,
    );
  }

  Future<NetworkResponse<ResponseType>>
  _request<ResponseType extends Mappable>({
    required String method,
    required ResponseType responseType,
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    dynamic encoding,
    Function(int, int)? onSendProgress,
  }) async {
    dio.options
      ..baseUrl = baseUrl
      ..headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": await SecureStorageController.authToken,
        "Accept-Language": isEn ? 'en' : 'ar',
      };
    log("Url: ${dio.options.baseUrl}$url");
    log("headers: ${dio.options.headers}");
    log("Body: $body");
    log("Query Parameters: $queryParameters");
    try {
      Response response;
      final options = Options(requestEncoder: encoding);

      switch (method) {
        case 'GET':
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            data: body,
          );
          break;
        case 'POST':
          response = await dio.post(
            url,
            data: body,
            options: options,
            onSendProgress: onSendProgress,
          );
          break;
        case 'PUT':
          response = await dio.put(url, data: body, options: options);
          break;
        case 'PATCH':
          response = await dio.patch(url, data: body, options: options);
          break;
        case 'DELETE':
          response = await dio.delete(url, data: body, options: options);
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }
      log(" Status Code : ${response.statusCode}");
      log("Response: ${response.data}");
      return _handleResponse(response, responseType);
    } on DioException catch (e) {
      log("errorrr ${e.response}");
      return e.response != null
          ? _handleResponse(e.response!, responseType)
          : _handleDioError(e, responseType);
    }
  }

  NetworkResponse<ResponseType> _handleResponse<ResponseType extends Mappable>(
    Response response,
    ResponseType responseType,
  ) {
    final int statusCode = response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300) {
      final parsedData =
          responseType is ListMappable
              ? Mappable(responseType, response.data)
              : Mappable(responseType, response);
      return NetworkResponse<ResponseType>(
        parsedData as ResponseType,
        true,
        "",
      );
    }
    if (statusCode == 401) {
      PreferenceManager().logout();
    }
    final errorMessage = switch (statusCode) {
      401 || 403 || 404 || 422 || 400 =>
        response.data['data'] is String
            ? response.data['data']
            : (response.data['message']?.toString() ?? "Error"),
      _ => _getErrorFromJson(json.decode(response.toString())),
    };

    return NetworkResponse<ResponseType>(
      Mappable(responseType, response) as ResponseType,
      false,
      errorMessage,
    );
  }

  NetworkResponse<ResponseType> _handleDioError<ResponseType extends Mappable>(
    DioException e,
    ResponseType responseType,
  ) {
    final message = switch (e.type) {
      DioExceptionType.connectionError => "no_network",
      DioExceptionType.cancel => "message_cancelled",
      _ => "Request Error",
    };

    final errorJson = ErrorResponse(error: [Error(message: message)]).toJson();

    return NetworkResponse<ResponseType>(
      Mappable(responseType, jsonEncode(errorJson)) as ResponseType,
      false,
      message,
    );
  }

  String _getErrorFromJson(Map<String, dynamic> json) {
    log("Response is : $json");
    if (json['error'] is String) return json['error'];

    final errorResponse = ErrorResponse.fromJson(json);
    final buffer = StringBuffer();

    for (final error in errorResponse.error ?? []) {
      buffer.writeln(error.message ?? '');
    }

    return buffer.isEmpty ? "Unknown Error" : buffer.toString();
  }
}
