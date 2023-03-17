import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iloilocityapp/app/data/services/network/config/auth_interceptor.dart';

class NetworkProvider {
  late Dio _dio;
  static const _requestTimeout = 60000;

  NetworkProvider() {
    final options = BaseOptions(
      baseUrl: 'https://develop.cityserve-iloilo.highlysucceed.com',
      connectTimeout: _requestTimeout,
      receiveTimeout: _requestTimeout,
      contentType: 'application/json',
    );
    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<String> get(String uri, [Map<String, dynamic>? params]) async {
    final Response<String> response = await _dio.get(
      uri,
      options: Options(responseType: ResponseType.plain),
    );
    return response.data ?? "";
  }

  Future<String> post(String uri, {dynamic body, Map<String, dynamic>? queryParams}) async {
    Response<String> response = await _dio.post(
      uri,
      data: body,
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.plain),
    );
    return response.data ?? "";
  }

  Future<String> put(String uri, {Object? body, Map<String, dynamic>? queryParams}) async {
    final Response<String> response = await _dio.put(
      uri,
      data: jsonEncode(body),
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.plain),
    );
    return response.data ?? "";
  }

  Future<String> delete(String uri, {Object? body, Map<String, dynamic>? queryParams}) async {
    final Response<String> response = await _dio.delete(
      uri,
      data: jsonEncode(body),
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.plain),
    );
    return response.data ?? "";
  }

  Future<String> upload(
    String uri, {
    FormData? formData,
    Map<String, dynamic>? queryParams,
    Function(int sent, int total)? onSendProgress,
  }) async {
    final Response<String> response = await _dio.post(
      uri,
      data: formData,
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.plain),
      onSendProgress: (int sent, int total) {
        if (onSendProgress == null) {
          return;
        }
        onSendProgress(sent, total);
      },
    );

    return response.data ?? '';
  }
}
