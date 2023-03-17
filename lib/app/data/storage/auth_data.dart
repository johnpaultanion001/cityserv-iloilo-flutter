import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/auth_service/models/auth_response.dart';
import 'package:iloilocityapp/app/data/storage/local_storage_provider.dart';

class AuthData {
  final authKey = 'authResponse';

  final LocalStorageProvider _provider;
  AuthData(this._provider);

  Future saveAuthData(String value) async {
    await _provider.saveValue(key: authKey, value: value);
  }

  Future<String> getToken() async {
    String auth = await _provider.getValue(key: authKey);
    return auth.isEmpty ? auth : AuthResponse.fromJson(jsonDecode(auth)).token;
  }

  Future<AuthResponse> getAuthData() async {
    String auth = await _provider.getValue(key: authKey);
    return AuthResponse.fromJson(jsonDecode(auth));
  }

  Future<dynamic> clearData() async {
    await _provider.deleteValue(key: authKey);
  }
}
