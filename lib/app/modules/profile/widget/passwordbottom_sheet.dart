// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/custom_button.dart';
// import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordBottomSheet {
  static void passwordBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 440),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: size24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password Updated',
                        style: TextStyle(
                          fontSize: 22,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size32,
                ),
                Center(
                  child: SizedBox(
                    height: size80,
                    width: 130,
                    child: Image.asset(
                      AssetsPath.passwordLock,
                      height: size80,
                      width: 130,
                      fit: BoxFit.cover,
                      // color: const Color(0xff00A652),
                    ),
                  ),
                ),
                SizedBox(
                  height: size32,
                ),
                Text(
                  'Congratulations! Your Password',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'has been updated, make sure',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'to update your password regularly',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: size24),
                  child: CustomButton(
                    color: primaryColor,
                    onPresssed: () {
                      Get.back();
                      Get.back();
                    },
                    buttonText: 'CONTINUE',
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: 32),
          ),
        );
      },
    );
  }
}
