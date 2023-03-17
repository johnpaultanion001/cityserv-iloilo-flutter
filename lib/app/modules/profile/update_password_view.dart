// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
// import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
// import 'package:iloilocityapp/app/global/widgets/custom_button.dart';
// import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
// import 'package:iloilocityapp/app/modules/profile/widget/passwordbottom_sheet.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final firstNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return AppScaffoldWithHeader(
      title: 'Update Password',
      subTitle: 'Update your Password',
      content: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: size15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password Information',
                      style: kHeader2TextStyle,
                    ),
                  ),
                ),
                CustomTextField(
                  textEditingController: firstNameTextController,
                  isObscureText: false,
                  hintText: 'Current Password',
                  textAlign: TextAlign.left,
                  node: node.nextFocus(),
                ),
                const SizedBox(
                  height: size24,
                ),
                CustomTextField(
                  textEditingController: firstNameTextController,
                  isObscureText: false,
                  hintText: 'New Password',
                  textAlign: TextAlign.left,
                  node: node.nextFocus(),
                ),
                const SizedBox(
                  height: size24,
                ),
                CustomTextField(
                  textEditingController: firstNameTextController,
                  isObscureText: false,
                  hintText: 'Re-Enter New Password',
                  textAlign: TextAlign.left,
                  node: node.nextFocus(),
                ),
              ],
            ),
          ),
          Spacer(),
          AppElevatedButton(
              color: primaryColor,
              child: Text(
                'SAVE CHANGES'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      // bottomsheet: Padding(
      //   padding: const EdgeInsets.only(bottom: size24),
      //   child: CustomButton(
      //     color: primaryColor,
      //     onPresssed: () {
      //       PasswordBottomSheet.passwordBottomSheetMenu(context);
      //     },
      //     buttonText: 'SAVE CHANGES',
      //   ),
      // ),
    );
  }
}
