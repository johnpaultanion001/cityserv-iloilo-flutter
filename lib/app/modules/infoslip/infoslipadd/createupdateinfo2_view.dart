// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateInfoSlipView2 extends GetView<InfoSlipController> {
  const CreateUpdateInfoSlipView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InfoSlipController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: statusBarColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsPath.mainBg),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 72,
                width: double.infinity,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'APPLICATION FOR',
                              style: TextStyle(
                                fontSize: 13,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'INFORMATION SLIP',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Create New Request',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(top: 24, right: 24, bottom: 24, left: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Enter the information in the required fields',
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 15,
                      color: requiredTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Services Requested',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.services.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Obx(
                                () => CheckboxListTile(
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: controller.isChecked.value[index],
                                  title: Text(
                                    controller.services[index],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                  onChanged: (value) {
                                    // controller.isValidServices.value = true;
                                    // if (controller.selectedServices.value.contains(controller.services[index])) {
                                    //   controller.selectedServices.value.remove(controller.services[index]);
                                    // } else {
                                    //   controller.selectedServices.value.add(controller.services[index]);
                                    // }

                                    controller.isChecked.value[index] = value!;
                                    if (value == true) {
                                      controller.selectedServices.value
                                          .add(controller.services[index]);
                                    } else {
                                      (controller.selectedServices.value
                                              .contains(
                                                  controller.services[index]))
                                          ? controller.selectedServices.value
                                              .remove(
                                                  controller.services[index])
                                          : debugPrint("ok");
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.selectedServices.value.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(left: 36.0),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Required field must not be empty!',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                      //   child: TextField(
                      //     controller: controller.approvedEditingController,
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5.0),
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       filled: true,
                      //       fillColor: const Color(0xffF5F5F5),
                      //       hintText: 'Request Approved*',
                      //       hintStyle: TextStyle(
                      //         color: textFieldTextColor,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                      //   child: TextField(
                      //     controller: controller.disapprovedEditingController,
                      //     maxLines: 7,
                      //     minLines: 7,
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5.0),
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       filled: true,
                      //       fillColor: const Color(0xffF5F5F5),
                      //       hintText: 'Reason for Disapproval*',
                      //       hintStyle: TextStyle(
                      //         color: textFieldTextColor,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingOnly(bottom: 40),
        ),
      ),
      bottomSheet: Padding(
        // color: statusBarColor,
        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: successButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              // if (controller.isUpdate.value == false) {
              //   Get.toNamed(incidentreportapp);
              // } else {
              // ApplicationBottomSheet.applicationBottomSheetMenu(context);
              controller.onCreateRecord(context);
              // }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.isUpdate.value == false
                        ? 'CREATE RECORD'
                        : 'SAVE CHANGES',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.white,
                ),
              ],
            ).paddingSymmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
