// ignore_for_file: avoid_print

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/clearance/clearance_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationBottomSheet {
  static void applicationBottomSheetMenu(BuildContext context) {
    final controller = Get.put(ClearanceController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      // isDismissible: false,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 335),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.isUpdate.value == false
                        ? 'Application Completed!'
                        : 'Success!',
                    style: TextStyle(
                      fontSize: 22,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 125,
                    width: 125,
                    child: Image.asset(
                      AssetsPath.survey,
                      height: 125,
                      width: 125,
                      fit: BoxFit.cover,
                      // color: const Color(0xff00A652),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (controller.isUpdate.value == false) {
                          Get.back();
                          Get.back();
                          Get.toNamed(clearanceapp);
                          print('false');
                        } else {
                          Get.back();
                          Get.back();
                          Get.back();
                          print('true');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              controller.isUpdate.value == false
                                  ? 'VIEW FORM'
                                  : 'VIEW FORM',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12),
                    ),
                  ),
                )
              ],
            ).paddingSymmetric(vertical: 32),
          ),
        );
      },
    );
  }
}
