import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoloParentApp extends GetView<SoloParentController> {
  const SoloParentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SoloParentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: statusBarColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                              'SOLO PARENT',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'New Application',
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
                    Get.toNamed(createupdateinfo1);
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
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
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
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Birthdate:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.birthdayEditingController.text,
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
                        children: [
                          const Text(
                            'Gender:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedGender.type.toString(),
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
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Address:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.addressEditingController.text,
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
                        children: [
                          const Text(
                            'Higest Educ. Attainment:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.highEducEditingController.text,
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
                        children: [
                          const Text(
                            'Telephone Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.telNumberEditingController.text,
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
                        children: [
                          const Text(
                            'Occupation:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.occupationEditingController.text,
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
                        children: [
                          const Text(
                            'Monthly Income:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.monthlyEditingController.text,
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
                        children: [
                          const Text(
                            'Total Monthly Income:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.totalMonthlyEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'I. Family Composition',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 12),
                      Row(
                        children: [
                          const Text(
                            'Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.nameIEditingController.text,
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
                        children: [
                          const Text(
                            'Relationship:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.relationIEditingController.text,
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
                        children: [
                          const Text(
                            'Age:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.ageIEditingController.text,
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
                        children: [
                          const Text(
                            'Status:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedStatus.toString(),
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
                        children: [
                          const Text(
                            'Educational Attainment:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.educAttainIEditingController.text,
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
                        children: [
                          const Text(
                            'Occupation / Monthly Income:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.occupationIEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'II. Classification / Circumtances of being a Solo Parent:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 12),
                      Row(
                        children: [
                          const Text(
                            'Description:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.detailsIIEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'III. Needs / Problems of Solo Parents:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 12),
                      Row(
                        children: [
                          const Text(
                            'Description:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.detailsIIIEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IV. Family Resources:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 12),
                      Row(
                        children: [
                          const Text(
                            'Description:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.detailsIIVEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 12),
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
    );
  }
}
