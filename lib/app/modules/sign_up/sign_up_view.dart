import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/register_param.dart';
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

import '../../global/widgets/basic/app_dropdown_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final controller = getIt<SignUpController>();
  final fnameTextController = TextEditingController();
  final lnameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  final contactTextController = TextEditingController();

  final bdayTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final zipCodeTextController = TextEditingController();

  String civilStatus = 'Civil Status';
  String gender = 'Gender';
  String region = 'Region';
  String province = 'Province';
  String city = 'City';
  String barangay = 'Barangay';

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return AppScaffoldWithHeader(
      title: 'Sign Up',
      subTitle: 'Create a New Account',
      content: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: size15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'User Information',
                      style: kHeader2TextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: fnameTextController,
                    isObscureText: false,
                    hintText: 'First Name',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  // CustomTextField(
                  //   textEditingController: testTextController,
                  //   isObscureText: false,
                  //   hintText: 'Middle Name',
                  //   textAlign: TextAlign.left,
                  //   node: node.nextFocus(),
                  // ),
                  // const SizedBox(
                  //   height: size24,
                  // ),
                  CustomTextField(
                    textEditingController: lnameTextController,
                    isObscureText: false,
                    hintText: 'Last Name',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),

                  const SizedBox(
                    height: size24,
                  ),
                  // CustomDropDown(
                  //   hintText: 'Civil Status',
                  //   dropDownValue: controller.dropDownCivilStatusValue.value,
                  //   dynamics: CivilStatus,
                  //   selectionList: controller.statusList,
                  //   selectedText: controller.selectedStatus.type.toString(),
                  // ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          civilStatus,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          civilStatus = newValue!;
                        });
                      },
                      items: <String>[
                        'SINGLE',
                        'MARRIED',
                        'WIDOWED',
                        'SEPARATED',
                        'DIVORCED',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          gender,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                      items: <String>[
                        'MALE',
                        'FEMALE',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: bdayTextController,
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
                          bdayTextController.text = pickedDate.toString();
                          //isValidBirthdate.value = false;
                        });
                      },
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.date),
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'User Address',
                      style: kHeader2TextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          region,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          region = newValue!;
                        });
                      },
                      items: <String>[
                        'REGION 1',
                        'REGION 2',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          province,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          province = newValue!;
                        });
                      },
                      items: <String>[
                        'PROVINCE 1',
                        'PROVINCE 2',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          city,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          city = newValue!;
                        });
                      },
                      items: <String>[
                        'CITY 1',
                        'CITY 2',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  Container(
                    height: size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size5),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding:
                            const EdgeInsets.only(left: size15, right: size24),
                        child: Text(
                          barangay,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      iconEnabledColor: primaryColor,
                      icon: const ImageIcon(
                        AssetImage(AssetsPath.dropDown),
                        size: 35,
                      ).paddingOnly(right: size4),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          barangay = newValue!;
                        });
                      },
                      items: <String>[
                        'BARANGAY 1',
                        'BARANGAY 2',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: addressTextController,
                    isObscureText: false,
                    hintText: 'Street Address',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: zipCodeTextController,
                    isObscureText: false,
                    hintText: 'Zip Code',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  const Align(
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
                    textEditingController: contactTextController,
                    isObscureText: false,
                    hintText: 'Contact Number',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  // CustomTextField(
                  //   textEditingController: testTextController,
                  //   isObscureText: false,
                  //   hintText: 'Telephone Number',
                  //   textAlign: TextAlign.left,
                  //   node: node.nextFocus(),
                  // ),
                  // const SizedBox(
                  //   height: size24,
                  // ),
                  CustomTextField(
                    textEditingController: emailTextController,
                    isObscureText: false,
                    hintText: 'Email Address',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: passwordTextController,
                    isObscureText: true,
                    hintText: 'Password',
                    textAlign: TextAlign.left,
                    node: node.nextFocus(),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  CustomTextField(
                    textEditingController: confirmTextController,
                    isObscureText: true,
                    hintText: 'Confirm Password',
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
          Obx(() {
            return AppElevatedButton(
                color: primaryColor,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: kWhite,
                      )
                    : Text(
                        'SIGN UP'.toUpperCase(),
                        style: kHeader3TextStyle.copyWith(color: kWhite),
                      ),
                onPressed: () async {
                  var data = RegisterParam(
                    email: emailTextController.text,
                    fname: fnameTextController.text,
                    lname: lnameTextController.text,
                    contactNumber: contactTextController.text,
                    password: passwordTextController.text,
                    passwordConfirmation: confirmTextController.text,
                    gender: gender,
                    civilStatus: civilStatus,
                    birthday: bdayTextController.text,
                    region: region,
                    province: province,
                    city: city,
                    barangay: barangay,
                    address: addressTextController.text,
                    zipCode: zipCodeTextController.text,
                  );
                  await controller.signUpUser(data);
                });
          })
        ],
      ),
    );
  }
}
