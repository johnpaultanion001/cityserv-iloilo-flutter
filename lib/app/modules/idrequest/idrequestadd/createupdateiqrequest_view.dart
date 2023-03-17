// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
// import 'package:iloilocityapp/app/modules/idrequest/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/modules/idrequest/idrequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateIdRequestView extends GetView<IdRequestController> {
  const CreateUpdateIdRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(IdRequestController());
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
                    'Enter the information in the requried fields',
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
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.givenNameEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidGivenName.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Given Name*',
                              errorText: controller.isValidGivenName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.middleNameEditingController,
                          onEditingComplete: () => node.nextFocus(),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            // controller.isValidMiddleName.value = false;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            // errorText: controller.isValidMiddleName.value ? 'Required field must not be empty!' : null,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Middle Name*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.lastNameEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidLastName.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidLastName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Last Name*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.addressEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddress.value = false;
                            },
                            maxLines: 5,
                            minLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidAddress.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Address*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.ageEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAge.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              errorText: controller.isValidAge.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Age*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.sssNumberEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidSSSNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              errorText: controller.isValidSSSNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'SSS Number*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.birthdateEditingController,
                            readOnly: true,
                            // enabled: false,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidBirthdate.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950, 1),
                                    lastDate: DateTime(2100, 12),
                                  ).then((pickedDate) {
                                    controller.birthdateEditingController.text =
                                        pickedDate.toString();
                                    controller.isValidBirthdate.value = false;
                                  });
                                },
                                icon: ImageIcon(
                                  const AssetImage(AssetsPath.date),
                                  color: primaryColor,
                                  size: 30,
                                ),
                              ),
                              errorText: controller.isValidBirthdate.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Birthdate*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.yearsEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidYears.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidYears.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Number Years in Salinas*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.precintEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidPrecintNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidPrecintNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Precint No.*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.dateIssuedEditingController,
                            readOnly: true,
                            // enabled: false,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDateIssued.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  print('DATE');
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950, 1),
                                    lastDate: DateTime(2100, 12),
                                  ).then((pickedDate) {
                                    controller.dateIssuedEditingController
                                        .text = pickedDate.toString();
                                    controller.isValidDateIssued.value = false;
                                  });
                                },
                                icon: ImageIcon(
                                  const AssetImage(AssetsPath.date),
                                  color: primaryColor,
                                  size: 30,
                                ),
                              ),
                              errorText: controller.isValidDateIssued.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Date Issued*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.emergencyEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidEmergencyContact.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText:
                                  controller.isValidEmergencyContact.value
                                      ? 'Required field must not be empty!'
                                      : null,
                              hintText: 'Person in case of Emergency*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.contactNoEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidContactNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidContactNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Contact Number*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
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
        padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: successButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              // Get.toNamed(createupdateinfo3);
              // ApplicationBottomSheet.applicationBottomSheetMenu(context);
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
                const Icon(
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
