// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/cedula/cedula_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CedulaApp extends GetView<CedulaController> {
  const CedulaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CedulaController());
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
                height: 90,
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
                              'COMMUNITY TAX',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'CERTIFICATE:',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(Auditors Copy)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
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
              ).paddingOnly(top: 24, right: 24, bottom: 12, left: 8),
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
                    Get.toNamed(createupdatecedula);
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
                            'Year:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.yearEditingController.text,
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
                            'Place Issue:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.placeIssuedEditingController.text,
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
                            '',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TIN(if any):',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '123-1234-222',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Middle Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.middleNameEditingController.text,
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
                            'Sex:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedGender.type.toString(),
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
                            'Citizen:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.citizenshipEditingController.text,
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
                            'ICR No:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.icrNoEditingController.text,
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
                            'Place of Birth:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.birthPlaceEditingController.text,
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
                            controller.birthPlaceEditingController.text,
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
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Civil Status',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 12),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.civilStatus.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Obx(
                              () => CheckboxListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: controller.isChecked.value[index],
                                title: Text(
                                  controller.civilStatus[index],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                                onChanged: (val) {
                                  // controller.isChecked.value[index] = val!;
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Height:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.heightEditingController.text,
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
                            'Weight:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.weightEditingController.text,
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
                              'Profession/Occupation',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Business:        ',
                                style: TextStyle(fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                controller.occupationEditingController.text,
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
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'A. ADDITIONAL COMMUNITY TAX',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(Not to exceed ₱ 5,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ ${controller.basicCedulaEditingController.text}',
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
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'B. ADDITIONAL COMMUNITY TAX',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(Not to exceed ₱ 5,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. Gross receipts or earnings derived from business during the preceding year (₱ 1.00 for every ₱1,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 3),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ ${controller.addCedula1EditingController.text}',
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2. Salaries or gross receipt or earnings derived from business during the preceding year (₱ 1.00 for every ₱ 1,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 3),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ ${controller.addCedula2EditingController.text}',
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3. Income from real property (₱ 1.00 for every ₱1,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 3),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ ${controller.addCedula3EditingController.text}',
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
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ 100',
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
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'INTEREST',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ 100',
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
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TOTAL AMOUNT PAID',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            '₱ 100',
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
                        height: 65,
                      )
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
