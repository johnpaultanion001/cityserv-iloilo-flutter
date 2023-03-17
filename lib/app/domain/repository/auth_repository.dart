import 'package:iloilocityapp/app/data/services/network/auth_service/auth_api.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/auth_response.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/login_param.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/register_param.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/auth_service.dart';

class AuthRepository {
  final AuthAPI _authApi;

  AuthRepository(this._authApi);

  Future<AuthResponse?> loginByEmail(LoginParams data) async {
    return await _authApi.loginByEmail(data);
  }

  Future<AuthResponse?> register(RegisterParam data) async {
    return await _authApi.register(data);
  }
}
