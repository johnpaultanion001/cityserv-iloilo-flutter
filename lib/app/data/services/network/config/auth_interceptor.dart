import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iloilocityapp/app/data/services/services.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';

class AuthInterceptor extends Interceptor {
  static const String authHeader = "Authorization";
  static const String sessionExpirationTime = "X-NX-Session-Expiration-Time";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String authToken = await Services.authData.getToken();
    options.headers = {...options.headers, authHeader: 'Bearer $authToken'};
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    //Todo: handle http errors.
    return handler.next(err);
  }
}
