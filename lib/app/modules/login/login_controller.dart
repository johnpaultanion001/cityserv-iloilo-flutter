import 'dart:convert';

import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/login_param.dart';
import 'package:iloilocityapp/app/data/storage/auth_data.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/domain/repository/auth_repository.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var authResponse = {}.obs;
  final AuthRepository _authRepository;
  final AppNavigation navigation;
  final AuthData _auth;
  LoginController(this._authRepository, this.navigation, this._auth);
  Future loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      var data = LoginParams(email: email, password: password);
      var response = await _authRepository.loginByEmail(data);
      if (response != null) {
        await _auth.saveAuthData(jsonEncode(response.toJson()));
        Get.offAllNamed(bottomnav);
      }
    } on Exception catch (_) {
      handleError(title: 'Login failed', message: 'Username or password is incorrect!');
    }
    isLoading.value = false;
  }

  void navigateToForgotPassword() {
    navigation.showSnackBar(AppStrings.notYetImplemented);
    // navigation.navigateToNamed(forgotpassword);
  }
}
