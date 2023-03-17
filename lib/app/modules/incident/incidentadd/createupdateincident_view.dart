// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/incident/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/modules/incident/incidentreport_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateIncidentView extends GetView<IncidentReportController> {
  const CreateUpdateIncidentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(IncidentReportController());
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
                            controller.isUpdate.value = false;
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
                              'INCIDENT REPORT',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Obx(
                              () => Text(
                                controller.isUpdate.value == false
                                    ? 'Add New Incident Report'
                                    : 'Update Incident Report',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
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
              ).paddingOnly(top: 24, right: 24, bottom: 16, left: 8),
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
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Obx(
                  () => controller.isUpdate.value == true
                      ? InkWell(
                          onTap: () {
                            ApplicationBottomSheet.uploadPhotoBottomSheetMenu(
                                context, controller.image);
                          },
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: FileImage(controller.image!),
                                fit: BoxFit.cover,
                                opacity: 0.5,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Upload Report Photo',
                                    style: TextStyle(color: Colors.white),
                                  ).paddingOnly(right: 8),
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : controller.fileTypeimageprofile.value.isEmpty
                          ? InkWell(
                              onTap: () {
                                ApplicationBottomSheet
                                    .uploadPhotoBottomSheetMenu(
                                        context, controller.image);
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                color: const Color(0xffBEBEBE),
                                dashPattern: const [10, 4, 10, 4],
                                radius: const Radius.circular(5),
                                padding: const EdgeInsets.all(6),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Upload Report Photo',
                                        style: TextStyle(
                                            color: textFieldTextColor),
                                      ).paddingOnly(right: 8),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: textFieldTextColor,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: FileImage(controller.image!),
                                  fit: BoxFit.cover,
                                  opacity: 0.7,
                                ),
                              ),
                            ),
                ),
              ).paddingSymmetric(horizontal: 24, vertical: 12),
              Obx(
                () => controller.isEmptyImage.value == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 36.0, bottom: 6),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Required field must not be empty!',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Report Information',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24, vertical: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.caseNumberEditingController,
                          readOnly: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Case Number*',
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<Case>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownCaseValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Nature Case/s Filed*',
                                          style: TextStyle(
                                            color: textFieldTextColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedCase.type!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                              ),
                              // value: selectedGroup,
                              isExpanded: true,

                              iconEnabledColor: primaryColor,
                              icon: const ImageIcon(
                                AssetImage(AssetsPath.dropDown),
                                size: 35,
                              ).paddingOnly(right: 4),
                              style: const TextStyle(color: Colors.black),
                              items: controller.casesList.map((Case? cases) {
                                return DropdownMenuItem<Case>(
                                  value: cases,
                                  child: Text(
                                    cases!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Case? newValue) {
                                controller.isValidCase.value = true;
                                controller.selectedCase = newValue!;
                                controller.dropDownCaseValue.value =
                                    newValue.type.toString();
                                node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidCase.value &&
                                controller.dropDownCaseValue.isEmpty
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
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.caseDescEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDesc.value = false;
                            },
                            maxLines: 6,
                            minLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidDesc.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Case Description*',
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
                            controller:
                                controller.complainDateEditingController,
                            readOnly: true,
                            // enabled: false,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDateComp.value = false;
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
                                    controller.complainDateEditingController
                                        .text = pickedDate.toString();
                                    controller.isValidDateComp.value = false;
                                  });
                                },
                                icon: ImageIcon(
                                  const AssetImage(AssetsPath.date),
                                  color: primaryColor,
                                  size: 30,
                                ),
                              ),
                              errorText: controller.isValidDateComp.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Complaint Date*',
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
                            controller: controller.filedDateEditingController,
                            readOnly: true,
                            // enabled: false,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDateFiled.value = false;
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
                                    controller.filedDateEditingController.text =
                                        pickedDate.toString();
                                    controller.isValidDateFiled.value = false;
                                  });
                                },
                                icon: ImageIcon(
                                  const AssetImage(AssetsPath.date),
                                  color: primaryColor,
                                  size: 30,
                                ),
                              ),
                              errorText: controller.isValidDateFiled.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Filed Date*',
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
                            controller:
                                controller.complainNameEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidName.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Complaint Name*',
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
                            controller: controller.phoneNumberEditingController,
                            onEditingComplete: () => node.unfocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              controller.isValidNumber.value = false;
                              controller.phoneNumberString.value = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidNumber.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Phone Number*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.phoneNumberString.toString().length <
                                    11 ||
                                controller.phoneNumberString.toString().length >
                                    11 ||
                                !controller.phoneNumberString
                                    .toString()
                                    .startsWith('09')
                            ? Padding(
                                padding: const EdgeInsets.only(left: 36.0),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Please enter a valid phone number',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
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
              controller.onSubmitReport(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.isUpdate.value == false
                        ? 'SUBMIT REPORT'
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
