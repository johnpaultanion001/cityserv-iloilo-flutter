// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_controller.dart';
// import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateInfoView1 extends GetView<SoloParentController> {
  const CreateUpdateInfoView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SoloParentController());
    final node = FocusScope.of(context);
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
                            Obx(
                              () => Text(
                                controller.isUpdate.value == false
                                    ? 'Create New Request'
                                    : 'Update Application',
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
              ).paddingOnly(top: 24, right: 24, bottom: 18, left: 8),
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
                      const SizedBox(height: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.nameEditingController,
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
                              hintText: 'Name*',
                              // suffixText: '*',
                              // suffixStyle: TextStyle(
                              //   color: Colors.red,
                              //   fontSize: 15,
                              // ),
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
                              controller.ageString.value = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidAge.value
                                  ? 'Required field must not be empty!'
                                  : controller.ageString.toString().length < 2
                                      ? 'Age must not be less than 10!'
                                      : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Age*',
                              suffixText: '*',
                              suffixStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
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
                            controller: controller.birthdayEditingController,
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
                                  print('DATE');
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950, 1),
                                    lastDate: DateTime(2100, 12),
                                  ).then((pickedDate) {
                                    controller.birthdayEditingController.text =
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<Gender>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Gender*',
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
                                          controller.selectedGender.type!,
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
                              items:
                                  controller.genderList.map((Gender? gender) {
                                return DropdownMenuItem<Gender>(
                                  value: gender,
                                  child: Text(
                                    gender!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Gender? newValue) {
                                controller.isValidGender.value = false;
                                controller.selectedGender = newValue!;
                                controller.dropDownValue.value =
                                    newValue.type.toString();
                                node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidGender.value &&
                                controller.dropDownValue.isEmpty
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
                            controller: controller.birthplaceEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidBirthplace.value = false;
                            },
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidBirthplace.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Birthplace*',
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
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddress.value = false;
                            },
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidAddress.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Adderss*',
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
                            controller: controller.highEducEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidEduc.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidEduc.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Highest Educational Attainment*',
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
                            controller: controller.telNumberEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidTelNum.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              errorText: controller.isValidTelNum.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Telephone Number*',
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
                            controller: controller.occupationEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidOccupation.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidOccupation.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Occupation*',
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
                            controller: controller.monthlyEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAMonthly.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidAMonthly.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Monthly Income*',
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
                                controller.totalMonthlyEditingController,
                            onEditingComplete: () => node.unfocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              controller.isValidTotalMonthly.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidTotalMonthly.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Total Monthly Income*',
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
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              controller.onNextPressed();
              // Get.toNamed(createupdateinfo2);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
