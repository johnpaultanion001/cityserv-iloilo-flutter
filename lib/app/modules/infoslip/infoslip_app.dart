// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslip_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSlipApp extends GetView<InfoSlipController> {
  const InfoSlipApp({Key? key}) : super(key: key);

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
              ).paddingOnly(top: 24, right: 24, bottom: 24, left: 8),
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
                    Get.toNamed(createupdateslip);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Date:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.dateEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'CRTL Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.crtlNumberEditingController.text,
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
                            'Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.nameEditingController.text,
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
                            'Birthplace:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.birthplaceEditingController.text,
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
                            'Contact No:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.contactEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      SizedBox(
                        height: 8,
                      ),
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
                      ).paddingSymmetric(vertical: 12),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.services.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Obx(
                              () => CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: controller.isChecked.value[index],
                                title: Text(
                                  controller.services[index],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                                onChanged: (val) {
                                  controller.isChecked.value[index] = val!;
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Request Approved:',
                      //       style: TextStyle(fontSize: 15),
                      //     ),
                      //     const Spacer(),
                      //     Text(
                      //       'Approved',
                      //       style: TextStyle(color: primaryColor, fontSize: 15),
                      //     ),
                      //     const Spacer(),
                      //   ],
                      // ).paddingOnly(bottom: 6, top: 6),
                      // Divider(
                      //   height: 2,
                      //   color: mainDividerColor,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Reason for Disapproved:',
                      //       style: TextStyle(fontSize: 15),
                      //     ),
                      //     const Spacer(),
                      //     Text(
                      //       'Lorem ipsum dolor',
                      //       maxLines: 2,
                      //       style: TextStyle(color: primaryColor, fontSize: 15),
                      //     ),
                      //     const Spacer(),
                      //   ],
                      // ).paddingOnly(bottom: 6, top: 6),
                      // Divider(
                      //   height: 2,
                      //   color: mainDividerColor,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Address:',
                      //       style: TextStyle(fontSize: 15, color: Colors.transparent),
                      //     ),
                      //     const Spacer(),
                      //     Text(
                      //       'sit amet, consectetur adipiscing elit, sed do',
                      //       maxLines: 2,
                      //       style: TextStyle(color: primaryColor, fontSize: 15),
                      //     ),
                      //     const Spacer(),
                      //   ],
                      // ).paddingOnly(bottom: 6, top: 6),
                      // Divider(
                      //   height: 2,
                      //   color: mainDividerColor,
                      // ),
                    ],
                  ).paddingSymmetric(horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
