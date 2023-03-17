import 'package:iloilocityapp/app/data/services/network/auth_service/models/auth_response.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/login_param.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/register_param.dart';

abstract class AuthAPI {
  Future<AuthResponse?> loginByEmail(LoginParams data);
  Future<AuthResponse?> register(RegisterParam data);
}
