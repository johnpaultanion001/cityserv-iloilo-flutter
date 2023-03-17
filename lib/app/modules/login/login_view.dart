// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
import 'package:iloilocityapp/app/modules/login/login_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailTextController = TextEditingController(text: 'test1@gmail.com');
  final passwordTextController = TextEditingController(text: 'Hs2022!');
  final _controller = getIt<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsPath.loginBg),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: _loginView(),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    print('hey');
  }

  _loginView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Image.asset(
            AssetsPath.splashLogo,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Kamusta!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Maglogin sa iyong account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: size24),
          child: CustomTextField(
            textEditingController: emailTextController,
            isObscureText: false,
            hintText: 'Username/Email Address',
            textAlign: TextAlign.center,
            node: false,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: size24),
          child: CustomTextField(
            textEditingController: passwordTextController,
            isObscureText: true,
            hintText: 'Password',
            textAlign: TextAlign.center,
            node: false,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TextButton(
          onPressed: () => _controller.navigateToForgotPassword(),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: kRed, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: AppElevatedButton(
                isLoading: _controller.isLoading.value,
                color: Color(0xFF25AAE1),
                child: _controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: kWhite,
                      )
                    : Text(
                        'SIGN IN'.toUpperCase(),
                        style: kHeader3TextStyle.copyWith(color: kWhite),
                      ),
                onPressed: () async {
                  await _controller.loginUser(emailTextController.text, passwordTextController.text);
                }),
          );
        }),
        const SizedBox(
          height: 32,
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(signup);
          },
          child: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
