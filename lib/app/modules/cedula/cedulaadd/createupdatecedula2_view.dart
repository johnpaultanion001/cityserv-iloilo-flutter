// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/cedula/cedula_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateCedulaView2 extends GetView<CedulaController> {
  const CreateUpdateCedulaView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CedulaController());
    final node = FocusScope.of(context);
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
                              'View Pending Forms/Add New Request Here',
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
                      SizedBox(
                        height: 9,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'A. BASIC COMMUNITY TAX',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(₱ 5.00 Voluntary or Exempted(₱ 1.00))',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.basicCedulaEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidBasicCedula.value = false;
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Container(
                                width: 60,
                                height: 60,
                                color: textFieldSuffixColor,
                                child: Center(
                                  child: Text(
                                    '₱',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ).paddingOnly(right: 12),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidBasicCedula.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Amount*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
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
                      ).paddingSymmetric(horizontal: 24, vertical: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(Not to exceed ₱ 5,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24),
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
                      ).paddingSymmetric(horizontal: 24, vertical: 3),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.addCedula1EditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddCedula1.value = false;
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: textFieldSuffixColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '₱',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ).paddingOnly(right: 12),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidAddCedula1.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Amount*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2. Salaries or gross receipt or earnings derived from business during the preceding year (₱ 1.00 for every ₱ 1,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 3),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.addCedula2EditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddCedula2.value = false;
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: textFieldSuffixColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '₱',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ).paddingOnly(right: 12),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidAddCedula2.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Amount*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '3. Income from real property (₱ 1.00 for every ₱1,000.00)',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 3),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.addCedula3EditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddCedula3.value = false;
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: textFieldSuffixColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '₱',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ).paddingOnly(right: 12),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidAddCedula3.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Amount*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
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
                      ).paddingSymmetric(
                        horizontal: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.totalEditingController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: textFieldSuffixColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '₱',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ).paddingOnly(right: 12),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Amount*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
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
                      ).paddingSymmetric(
                        horizontal: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.interestEditingController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: textFieldSuffixColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '₱',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ).paddingOnly(right: 12),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Amount*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
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
                      ).paddingSymmetric(
                        horizontal: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.grandTotalEditingController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Container(
                              decoration: BoxDecoration(
                                color: textFieldSuffixColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              width: 60,
                              height: 60,
                              child: Center(
                                child: Text(
                                  '₱',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ).paddingOnly(right: 12),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Amount*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
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
              controller.onCreateRecord(context);
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
