// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
// import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/custom_button.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool isScreen1 = true;
  bool isScreen2 = false;
  bool isScreen3 = false;
  @override
  Widget build(BuildContext context) {
    final firstNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    return isScreen1 == true && isScreen2 == false && isScreen3 == false
        ? enterEmail(context)
        : isScreen1 == false && isScreen2 == true && isScreen3 == false
            ? enterVerifyCode(context)
            : isScreen1 == false && isScreen2 == false && isScreen3 == true
                ? passwordInfo(context)
                : SizedBox.shrink();
  }

  Widget enterEmail(BuildContext context) {
    final firstNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: true,
            headerText: 'Forgot Password',
            mainText: 'Update your Password',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: size40,
                  ),
                  Image.asset(
                    AssetsPath.passwordLock,
                    height: size90,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: size32,
                  ),
                  Text(
                    'Please enter your email address to',
                    style: kHeader2TextStyle,
                  ),
                  Text(
                    'search for your account',
                    style: kHeader2TextStyle,
                  ),
                  SizedBox(
                    height: size50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size24,
                    ),
                    child: CustomTextField(
                      textEditingController: firstNameTextController,
                      isObscureText: false,
                      hintText: 'Email Address',
                      textAlign: TextAlign.center,
                      node: node.nextFocus(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomsheet: Padding(
        padding: const EdgeInsets.only(bottom: size24),
        child: CustomButton(
          color: primaryColor,
          onPresssed: () {
            setState(() {
              isScreen1 = false;
              isScreen2 = true;
              isScreen3 = false;
            });
          },
          buttonText: 'SUBMIT',
        ),
      ),
    );
  }

  Widget enterVerifyCode(BuildContext context) {
    final firstNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: true,
            headerText: 'Forgot Password',
            mainText: 'Update your Password',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: size40,
                  ),
                  Image.asset(
                    AssetsPath.passwordLock,
                    height: size90,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: size32,
                  ),
                  Text(
                    'Please enter the verification code sent ',
                    style: kHeader2TextStyle,
                  ),
                  Text(
                    'to your email:',
                    style: kHeader2TextStyle,
                  ),
                  SizedBox(
                    height: size24,
                  ),
                  Text(
                    'emailaddress@gmail.com',
                    style: kHeader2TextStyle,
                  ),
                  SizedBox(
                    height: size24,
                  ),
                  Text(
                    'to change your password',
                    style: kHeader2TextStyle,
                  ),
                  SizedBox(
                    height: size32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size24,
                    ),
                    child: CustomTextField(
                      textEditingController: firstNameTextController,
                      isObscureText: false,
                      hintText: 'Verification Code',
                      textAlign: TextAlign.center,
                      node: node.nextFocus(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomsheet: Padding(
        padding: const EdgeInsets.only(bottom: size24),
        child: CustomButton(
          color: primaryColor,
          onPresssed: () {
            setState(() {
              isScreen1 = false;
              isScreen2 = false;
              isScreen3 = true;
            });
          },
          buttonText: 'SUBMIT',
        ),
      ),
    );
  }

  Widget passwordInfo(BuildContext context) {
    final firstNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: true,
            headerText: 'Forgot Password',
            mainText: 'Update your Password',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24, vertical: size15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password Information',
                        style: kHeader2TextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size24,
                    ),
                    child: CustomTextField(
                      textEditingController: firstNameTextController,
                      isObscureText: false,
                      hintText: 'New Password',
                      textAlign: TextAlign.left,
                      node: node.nextFocus(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: size24,
                    ),
                    child: CustomTextField(
                      textEditingController: firstNameTextController,
                      isObscureText: false,
                      hintText: 'Re-Enter New Password',
                      textAlign: TextAlign.left,
                      node: node.nextFocus(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomsheet: Padding(
        padding: const EdgeInsets.only(bottom: size24),
        child: CustomButton(
          color: primaryColor,
          onPresssed: () {
            isScreen1 = true;
            isScreen2 = false;
            isScreen3 = false;
            Get.back();
          },
          buttonText: 'SAVE CHANGES',
        ),
      ),
    );
  }
}
