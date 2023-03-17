// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/custom_drop_down.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
import 'package:iloilocityapp/app/modules/sign_up/sign_up_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = getIt<SignUpController>();
    final firstNameTextController = TextEditingController();
    final node = FocusScope.of(context);
    node.unfocus();
    return AppScaffoldWithHeader(
      title: 'Edit Profile',
      subTitle: 'Update Profile Information',
      content: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'User Information',
                        style: kHeader2TextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size4),
                    child: ListTile(
                      onTap: () {},
                      minLeadingWidth: 10,
                      contentPadding: EdgeInsets.all(0),
                      leading: Container(
                        height: size60 + size2,
                        width: size60 + size2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            AssetsPath.camera,
                            height: size30,
                            width: size30,
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      title: Text('Upload Profile picture',
                          style: kHeader3TextStyle),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'First Name',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Middle Name',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Last Name',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomDropDown(
                    hintText: 'Civil Status',
                    dropDownValue: controller.dropDownCivilStatusValue.value,
                    dynamics: CivilStatus,
                    selectionList: controller.statusList,
                    selectedText: controller.selectedStatus.type.toString(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomDropDown(
                    hintText: 'Gender',
                    dropDownValue: controller.dropDownGenderValue.value,
                    dynamics: Gender,
                    selectionList: controller.genderList,
                    selectedText: controller.selectedGender.type.toString(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Birthday (MM/DD/YYYY)',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950, 1),
                          lastDate: DateTime(2100, 12),
                        ).then((pickedDate) {
                          firstNameTextController.text = pickedDate.toString();
                          //isValidBirthdate.value = false;
                        });
                      },
                      icon: ImageIcon(
                        const AssetImage(AssetsPath.date),
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'User Address',
                      style: kHeader2TextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomDropDown(
                    hintText: 'Province',
                    dropDownValue: controller.dropDownProvinceValue.value,
                    dynamics: Province,
                    selectionList: controller.provinceList,
                    selectedText: controller.selectedProvince.type.toString(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomDropDown(
                    hintText: 'City',
                    dropDownValue: controller.dropDownCityValue.value,
                    dynamics: City,
                    selectionList: controller.cityList,
                    selectedText: controller.selectedCity.type.toString(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomDropDown(
                    hintText: 'Barangay',
                    dropDownValue: controller.dropDownBarangayValue.value,
                    dynamics: Barangay,
                    selectionList: controller.barangayList,
                    selectedText: controller.selectedBarangay.type.toString(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Street Address',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Zip Code',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Other User Information',
                      style: kHeader2TextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Contact Number',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Telephone Number',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: firstNameTextController,
                    isObscureText: false,
                    hintText: 'Email Address',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                ],
              ),
            ),
          ),
          AppElevatedButton(
              color: primaryColor,
              child: Text(
                'SAVE CHANGES'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
