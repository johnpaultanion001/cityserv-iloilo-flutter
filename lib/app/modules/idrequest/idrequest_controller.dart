// ignore_for_file: unnecessary_overrides

import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/idrequest/applicationbottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdRequestController extends GetxController {
  RxBool isUpdate = false.obs;
  var givenNameEditingController = TextEditingController();
  var middleNameEditingController = TextEditingController();
  var lastNameEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var ageEditingController = TextEditingController();
  var sssNumberEditingController = TextEditingController();
  var birthdateEditingController = TextEditingController();
  var yearsEditingController = TextEditingController();
  var precintEditingController = TextEditingController();
  var dateIssuedEditingController = TextEditingController();
  var emergencyEditingController = TextEditingController();
  var contactNoEditingController = TextEditingController();
  RxBool isValidGivenName = false.obs;
  RxBool isValidMiddleName = false.obs;
  RxBool isValidLastName = false.obs;
  RxBool isValidAddress = false.obs;
  RxBool isValidAge = false.obs;
  RxBool isValidSSSNo = false.obs;
  RxBool isValidBirthdate = false.obs;
  RxBool isValidYears = false.obs;
  RxBool isValidPrecintNo = false.obs;
  RxBool isValidDateIssued = false.obs;
  RxBool isValidEmergencyContact = false.obs;
  RxBool isValidContactNo = false.obs;
  RxString contactNumberString = '09123456789'.obs;
  @override
  void onInit() {
    // if (isUpdate.value == true) {
    //   givenNameEditingController.text = 'Your Given Name';
    //   middleNameEditingController.text = 'Your Middle Name';
    //   lastNameEditingController.text = 'Your Last Name';
    //   addressEditingController.text = 'Address Here';
    //   ageEditingController.text = 'Age';
    //   sssNumberEditingController.text = 'SSS Number';
    //   birthdateEditingController.text = 'Birthdate Here';
    //   yearsEditingController.text = 'Years';
    //   precintEditingController.text = 'Precint';
    //   dateIssuedEditingController.text = 'Date Issued';
    //   emergencyEditingController.text = 'Emergency Contact';
    //   contactNoEditingController.text = 'Contact Number';
    // } else {
    //   givenNameEditingController.text = '';
    //   middleNameEditingController.text = '';
    //   lastNameEditingController.text = '';
    //   addressEditingController.text = '';
    //   ageEditingController.text = '';
    //   sssNumberEditingController.text = '';
    //   birthdateEditingController.text = '';
    //   yearsEditingController.text = '';
    //   precintEditingController.text = '';
    //   dateIssuedEditingController.text = '';
    //   emergencyEditingController.text = '';
    //   contactNoEditingController.text = '';
    // }
    super.onInit();
  }

  @override
  void dispose() {
    givenNameEditingController.dispose();
    middleNameEditingController.dispose();
    lastNameEditingController.dispose();
    addressEditingController.dispose();
    ageEditingController.dispose();
    sssNumberEditingController.dispose();
    birthdateEditingController.dispose();
    yearsEditingController.dispose();
    precintEditingController.dispose();
    dateIssuedEditingController.dispose();
    emergencyEditingController.dispose();
    contactNoEditingController.dispose();
    super.dispose();
  }

  // void isUpdated() {
  //   if (isUpdate.value == true) {
  //     givenNameEditingController.text = 'Your Given Name';
  //     middleNameEditingController.text = 'Your Middle Name';
  //     lastNameEditingController.text = 'Your Last Name';
  //     addressEditingController.text = 'Address Here';
  //     ageEditingController.text = 'Age';
  //     sssNumberEditingController.text = 'SSS Number';
  //     birthdateEditingController.text = 'Birthdate Here';
  //     yearsEditingController.text = 'Years';
  //     precintEditingController.text = 'Precint';
  //     dateIssuedEditingController.text = 'Date Issued';
  //     emergencyEditingController.text = 'Emergency Contact';
  //     contactNoEditingController.text = 'Contact Number';
  //   } else {
  //     givenNameEditingController.text = '';
  //     middleNameEditingController.text = '';
  //     lastNameEditingController.text = '';
  //     addressEditingController.text = '';
  //     ageEditingController.text = '';
  //     sssNumberEditingController.text = '';
  //     birthdateEditingController.text = '';
  //     yearsEditingController.text = '';
  //     precintEditingController.text = '';
  //     dateIssuedEditingController.text = '';
  //     emergencyEditingController.text = '';
  //     contactNoEditingController.text = '';
  //   }
  // }

  void clearFields() {
    givenNameEditingController.text = '';
    middleNameEditingController.text = '';
    lastNameEditingController.text = '';
    addressEditingController.text = '';
    ageEditingController.text = '';
    sssNumberEditingController.text = '';
    birthdateEditingController.text = '';
    yearsEditingController.text = '';
    precintEditingController.text = '';
    dateIssuedEditingController.text = '';
    emergencyEditingController.text = '';
    contactNoEditingController.text = '';
    isValidGivenName.value = false;
    isValidMiddleName.value = false;
    isValidLastName.value = false;
    isValidAddress.value = false;
    isValidAge.value = false;
    isValidSSSNo.value = false;
    isValidBirthdate.value = false;
    isValidYears.value = false;
    isValidPrecintNo.value = false;
    isValidDateIssued.value = false;
    isValidEmergencyContact.value = false;
    isValidContactNo.value = false;
  }

  void onCreateRecord(BuildContext context) {
    contactNumberString.value = contactNoEditingController.text;
    if (givenNameEditingController.text.isEmpty) {
      isValidGivenName.value = true;
    }
    // if (middleNameEditingController.text.isEmpty) {
    //   isValidMiddleName.value = true;
    // }
    if (lastNameEditingController.text.isEmpty) {
      isValidLastName.value = true;
    }
    if (addressEditingController.text.isEmpty) {
      isValidAddress.value = true;
    }
    if (ageEditingController.text.isEmpty) {
      isValidAge.value = true;
    }
    if (sssNumberEditingController.text.isEmpty) {
      isValidSSSNo.value = true;
    }
    if (birthdateEditingController.text.isEmpty) {
      isValidBirthdate.value = true;
    }
    if (yearsEditingController.text.isEmpty) {
      isValidYears.value = true;
    }
    if (precintEditingController.text.isEmpty) {
      isValidPrecintNo.value = true;
    }
    if (dateIssuedEditingController.text.isEmpty) {
      isValidDateIssued.value = true;
    }
    if (emergencyEditingController.text.isEmpty) {
      isValidEmergencyContact.value = true;
    }
    if (contactNoEditingController.text.isEmpty) {
      isValidContactNo.value = true;
    }
    if (contactNumberString.toString().length < 11 ||
        contactNumberString.toString().length > 11 ||
        !contactNumberString.toString().startsWith('09')) {
      isValidContactNo.value = true;
    }

    if (isValidGivenName.value == false &&
        // isValidMiddleName.value == false &&
        isValidLastName.value == false &&
        isValidAddress.value == false &&
        isValidAge.value == false &&
        isValidSSSNo.value == false &&
        isValidBirthdate.value == false &&
        isValidYears.value == false &&
        isValidPrecintNo.value == false &&
        isValidDateIssued.value == false &&
        isValidEmergencyContact.value == false &&
        isValidContactNo.value == false) {
      ApplicationBottomSheet.applicationBottomSheetMenu(context);
    } else {
      return;
    }
  }

  RxList<Records> reportList = <Records>[
    Records(
      id: '1',
      title: 'Form #: 000001',
      image: AssetsPath.clearance,
      date: '5 mins ago',
      status: 'Approved',
    ),
    Records(
      id: '2',
      title: 'Form #: 000002',
      image: AssetsPath.clearance,
      date: '3 weeks ago',
      status: 'Pending',
    ),
    Records(
      id: '1',
      title: 'Form #: 000003',
      image: AssetsPath.clearance,
      date: '1 Month ago',
      status: 'Pending',
    ),
    Records(
      id: '2',
      title: 'Form #: 000004',
      image: AssetsPath.clearance,
      date: '3 Months ago',
      status: 'Pending',
    ),
    Records(
      id: '1',
      title: 'Form #: 000005',
      image: AssetsPath.clearance,
      date: '10/11/2021',
      status: 'Pending',
    ),
    Records(
      id: '1',
      title: 'Form #: 000001',
      image: AssetsPath.clearance,
      date: '5 mins ago',
      status: 'Approved',
    ),
    Records(
      id: '2',
      title: 'Form #: 000002',
      image: AssetsPath.clearance,
      date: '3 weeks ago',
      status: 'Pending',
    ),
    Records(
      id: '1',
      title: 'Form #: 000003',
      image: AssetsPath.clearance,
      date: '1 Month ago',
      status: 'Pending',
    ),
    Records(
      id: '2',
      title: 'Form #: 000004',
      image: AssetsPath.clearance,
      date: '3 Months ago',
      status: 'Pending',
    ),
    Records(
      id: '1',
      title: 'Form #: 000005',
      image: AssetsPath.clearance,
      date: '10/11/2021',
      status: 'Pending',
    ),
  ].obs;
}

class Records {
  String? id;
  String? title;
  String? image;
  String? date;
  String? status;

  Records({this.id, this.title, this.image, this.date, this.status});
}
