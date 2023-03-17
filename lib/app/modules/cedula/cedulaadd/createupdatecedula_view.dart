// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
// import 'package:iloilocityapp/app/modules/cedula/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/modules/cedula/cedula_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateCedulaView extends GetView<CedulaController> {
  const CreateUpdateCedulaView({Key? key}) : super(key: key);

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
              ).paddingOnly(top: 24, right: 24, bottom: 12, left: 8),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.yearEditingController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: ImageIcon(
                              const AssetImage(AssetsPath.date),
                              color: primaryColor,
                              size: 30,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Year*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.placeIssuedEditingController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Place Issue*',
                            hintStyle: TextStyle(
                              color: textFieldTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.dateIssuedEditingController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: ImageIcon(
                              const AssetImage(AssetsPath.date),
                              color: primaryColor,
                              size: 30,
                            ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.tinEditingController,
                          onEditingComplete: () => node.nextFocus(),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'TIN(if any)',
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
                              errorText: controller.isValidGivenName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Given Name*',
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Middle Name',
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
                                          'Sex*',
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
                                controller.isValidSex.value = false;
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
                        () => controller.isValidSex.value &&
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
                            controller: controller.addressEditingController,
                            maxLines: 5,
                            minLines: 5,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAddress.value = false;
                            },
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.citizenshipEditingController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Citizenship*',
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
                            controller: controller.icrNoEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidICRNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidICRNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'ICR Number*',
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
                            controller: controller.birthPlaceEditingController,
                            maxLines: 5,
                            minLines: 5,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidBirthplace.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidBirthplace.value
                                  ? 'Required field must not be empty!'
                                  : null,
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
                            controller: controller.birthdateEditingController,
                            readOnly: true,
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
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidBirthdate.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Birthdate*',
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
                          'Civil Status',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.civilStatus.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Obx(
                                () => CheckboxListTile(
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: controller.isChecked.value[index],
                                  title: Text(
                                    controller.civilStatus[index],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                  onChanged: (val) {
                                    controller.isValidStatus.value = false;
                                    if (index == 0) {
                                      controller.isChecked.value[0] = val!;
                                      controller.isChecked.value[1] = false;
                                      controller.isChecked.value[2] = false;
                                      controller.isChecked.value[3] = false;
                                      controller.selectedStatus.value =
                                          controller.civilStatus[0];
                                    } else if (index == 1) {
                                      controller.isChecked.value[0] = false;
                                      controller.isChecked.value[1] = val!;
                                      controller.isChecked.value[2] = false;
                                      controller.isChecked.value[3] = false;
                                      controller.selectedStatus.value =
                                          controller.civilStatus[1];
                                    } else if (index == 2) {
                                      controller.isChecked.value[0] = false;
                                      controller.isChecked.value[1] = false;
                                      controller.isChecked.value[2] = val!;
                                      controller.isChecked.value[3] = false;
                                      controller.selectedStatus.value =
                                          controller.civilStatus[2];
                                    } else if (index == 3) {
                                      controller.isChecked.value[0] = false;
                                      controller.isChecked.value[1] = false;
                                      controller.isChecked.value[2] = false;
                                      controller.isChecked.value[3] = val!;
                                      controller.selectedStatus.value =
                                          controller.civilStatus[3];
                                    } else {
                                      controller.isChecked.value[0] = false;
                                      controller.isChecked.value[1] = false;
                                      controller.isChecked.value[2] = false;
                                      controller.isChecked.value[3] = false;
                                    }
                                    // controller.isChecked.value[index] = val!;
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidStatus.value &&
                                controller.selectedStatus.value.isEmpty
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
                            controller: controller.heightEditingController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => node.nextFocus(),
                            onChanged: (value) {
                              controller.isValidHeight.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidHeight.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Height*',
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
                            controller: controller.weightEditingController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => node.nextFocus(),
                            onChanged: (value) {
                              controller.isValidWeight.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidWeight.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Weight*',
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
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () => node.nextFocus(),
                            onChanged: (value) {
                              controller.isValidOccupation.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              errorText: controller.isValidOccupation.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              hintText: 'Profession / Occupation / Business*',
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
        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              // if (controller.isUpdate.value == false) {
              controller.onNextPressed(); // } else {
              //   ApplicationBottomSheet.applicationBottomSheetMenu(context);
              // }
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
