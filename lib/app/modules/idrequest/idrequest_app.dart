// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/idrequest/idrequest_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdRequestApp extends GetView<IdRequestController> {
  const IdRequestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(IdRequestController());
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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                              'BRGY. ID REQUEST',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'My Application',
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
              ).paddingOnly(top: 24, right: 24, left: 8),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: lightBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isUpdate.value = true;
                    // controller.isUpdated();
                    Get.toNamed(createupdateidrequest);
                  },
                  child: Text(
                    'Edit Application',
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Given Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.givenNameEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      controller.middleNameEditingController.text.isEmpty
                          ? SizedBox.fromSize()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Middle Name:',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const Spacer(),
                                Text(
                                  controller.middleNameEditingController.text,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 15),
                                ),
                                const Spacer(),
                              ],
                            ).paddingOnly(bottom: 6, top: 6),
                      controller.middleNameEditingController.text.isEmpty
                          ? SizedBox.fromSize()
                          : Divider(
                              height: 2,
                              color: mainDividerColor,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Last Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.lastNameEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Address:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.addressEditingController.text,
                            maxLines: 2,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Address:',
                            style: TextStyle(
                                fontSize: 15, color: Colors.transparent),
                          ),
                          const Spacer(),
                          Text(
                            controller.addressEditingController.text,
                            maxLines: 2,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Age:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.ageEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SSS Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.sssNumberEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Birthdate:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.birthdateEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'No. of Years in Salinas:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.yearsEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Precint No.:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.precintEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Date Issued:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.dateIssuedEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Person to contact',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'in Case of Emergency:',
                                style: TextStyle(fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                controller.emergencyEditingController.text,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Contact Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.contactNoEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        color: Colors.white,
      ),
    );
  }
}
