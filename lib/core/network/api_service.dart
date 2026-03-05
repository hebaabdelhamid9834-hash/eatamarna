import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eatamarna/core/failure/failures.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import 'api_end_points.dart';
class ApiService {
  late Dio dio;

  final tokenService = TokenStorageService();

  String get _baseUrlFromEnv => ApisEndpoints.baseUrl;

  ApiService._();

  static Future<ApiService> create() async {
    final instance = ApiService._();
    await instance._initialize();
    return instance;
  }

  Future<void> _initialize() async {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrlFromEnv,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final savedToken = await tokenService.getToken();
          if (savedToken != null &&
              savedToken.isNotEmpty &&
              savedToken != 'none') {
            options.headers['Authorization'] = 'Bearer $savedToken';
            options.headers['X-Guest-Token'] = savedToken;
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            log("Token is invalid or expired. Cleaning up...");
            await tokenService.deleteToken();
          }
          return handler.next(e);
        },
      ),
    );

    dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          enabled: kDebugMode,
          printResponseHeaders: true,
          printRequestHeaders: true,
          printResponseTime: true,
          printResponseRedirects: true,
        ),
      ),
    );
  }
  void _handleBusinessError(Response response) {
    final data = response.data;

    if (data is Map && data['status'] == 0) {
      throw ServerFailure.fromResponse(
        response.statusCode,
        data,
      );
    }
  }

  Never _handleDioError(DioException e) {
    throw ServerFailure.fromDioException(e);
  }

  Future<Map<String, dynamic>> get({
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response =
          await dio.get(urlEndPoint, queryParameters: queryParameters);
      _handleBusinessError(response);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<Map<String, dynamic>> post({
    required String urlEndPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.post(
        urlEndPoint,
        data: data,
        queryParameters: queryParameters,
      );
      _handleBusinessError(response);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> put({
    required String urlEndPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.put(
        urlEndPoint,
        data: data,
        queryParameters: queryParameters,
      );
      _handleBusinessError(response);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> delete({
    required String urlEndPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.delete(
        urlEndPoint,
        data: data,
        queryParameters: queryParameters,
      );
      _handleBusinessError(response);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> patch({
    required String urlEndPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.patch(
        urlEndPoint,
        data: data,
        queryParameters: queryParameters,
      );
      _handleBusinessError(response);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
