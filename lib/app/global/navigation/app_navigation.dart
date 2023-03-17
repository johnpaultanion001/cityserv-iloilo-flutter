import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/storage/auth_data.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class AppNavigation {
  final AuthData authData;
  AppNavigation(this.authData);
  Future<dynamic> logoutUser() async {
    Get.offAllNamed(login);
  }

  void navigateToNamed(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.toNamed(page, arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
  }

  void showSnackBar(String message, {String title = 'Message', snackPosition = SnackPosition.TOP, bool error = false}) {
    Get.snackbar(
      title,
      message,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      colorText: Colors.white,
      snackPosition: snackPosition,
      backgroundColor: error ? AppColors.kRed : AppColors.resolvedColor,
      icon: error
          ? const Icon(
              Icons.error_outline_sharp,
              color: Colors.white,
            )
          : const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
    );
  }

  void showErrorMessage(String message) {
    showSnackBar(message, title: 'Error', error: true);
  }
}
