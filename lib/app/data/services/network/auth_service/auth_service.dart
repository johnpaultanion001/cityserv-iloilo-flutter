// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/auth_service/auth_api.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/auth_response.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/login_param.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/register_param.dart';
import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';

class AuthService extends AuthAPI {
  final NetworkProvider _apiProvider;
  AuthService(this._apiProvider);

  @override
  Future<AuthResponse?> loginByEmail(LoginParams data) async {
    String response =
        await _apiProvider.post('/api/auth/login.json', body: data.toJson());
    if (response.isNotEmpty) {
      return AuthResponse.fromJson(jsonDecode(response));
    }
    return null;
  }

  @override
  Future<AuthResponse?> register(RegisterParam data) async {
    String response =
        await _apiProvider.post('/api/auth/register.json', body: data.toJson());
    if (response.isNotEmpty) {
      return AuthResponse.fromJson(jsonDecode(response));
    }
    return null;
  }
}
