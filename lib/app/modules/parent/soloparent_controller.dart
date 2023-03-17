// ignore_for_file: unnecessary_overrides

import 'dart:ffi';

import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/parent/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoloParentController extends GetxController {
  var nameEditingController = TextEditingController();
  var ageEditingController = TextEditingController();
  var birthdayEditingController = TextEditingController();
  var genderEditingController = TextEditingController();
  var birthplaceEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var highEducEditingController = TextEditingController();
  var telNumberEditingController = TextEditingController();
  var occupationEditingController = TextEditingController();
  var monthlyEditingController = TextEditingController();
  var totalMonthlyEditingController = TextEditingController();

  var nameIEditingController = TextEditingController();
  var relationIEditingController = TextEditingController();
  var ageIEditingController = TextEditingController();
  var statusIEditingController = TextEditingController();
  var educAttainIEditingController = TextEditingController();
  var occupationIEditingController = TextEditingController();

  var detailsIIEditingController = TextEditingController();
  var detailsIIIEditingController = TextEditingController();
  var detailsIIVEditingController = TextEditingController();

  RxInt tempIndex = 1.obs;
  RxBool isUpdate = false.obs;

  RxBool isValidName = false.obs;
  RxBool isValidAge = false.obs;
  RxBool isValidBirthdate = false.obs;
  RxBool isValidGender = false.obs;
  RxBool isValidBirthplace = false.obs;
  RxBool isValidAddress = false.obs;
  RxBool isValidEduc = false.obs;
  RxBool isValidTelNum = false.obs;
  RxBool isValidOccupation = false.obs;
  RxBool isValidAMonthly = false.obs;
  RxBool isValidTotalMonthly = false.obs;

  RxBool isValidNameI = false.obs;
  RxBool isValidRelationI = false.obs;
  RxBool isValidAgeI = false.obs;
  RxBool isValidStatusI = false.obs;
  RxBool isValidEducI = false.obs;
  RxBool isValidOccupationI = false.obs;
  var validateMe = <Bool>[].obs;

  RxBool isValidDetailsII = false.obs;
  RxBool isValidDetailsIII = false.obs;
  RxBool isValidDetailsIV = false.obs;
  RxBool isCheckCertify = false.obs;

  RxString ageString = '10'.obs;
  RxString ageStringI = '10'.obs;

  RxString dropDownValue = ''.obs;
  RxString dropDownStatusValue = ''.obs;

  RxInt index = 0.obs;
  var selectedGender = Gender();
  var selectedStatus = Status();
  RxString phoneNumberString = '09123456789'.obs;

  @override
  void onInit() {
    // ageString.value = ageEditingController.text;
    super.onInit();
  }

  void isUpdated() {
    nameEditingController.text = 'Juan Dela Cruz';
    ageEditingController.text = '24';
    birthdayEditingController.text = '12/25/2000';
    genderEditingController.text = 'Male';
    birthplaceEditingController.text = 'Lot#, St. Brgy, City';
    addressEditingController.text = 'Lot#, St. Brgy, City';
    highEducEditingController.text = 'College Graduate';
    telNumberEditingController.text = '09123456789';
    occupationEditingController.text = 'Tetacher';
    monthlyEditingController.text = 'Php 10,000';
    totalMonthlyEditingController.text = 'Php 20,000';

    nameIEditingController.text = 'Jr. Dela Cruz';
    relationIEditingController.text = 'Brother';
    ageIEditingController.text = '17';
    statusIEditingController.text = 'Single';
    educAttainIEditingController.text = 'Highschool';
    occupationIEditingController.text = 'Student / None';

    detailsIIEditingController.text = 'Lorem ipsum dolor sit';
    detailsIIIEditingController.text = 'Lorem ipsum dolor sit';
    detailsIIVEditingController.text = 'Lorem ipsum dolor sit';
  }

  void onNextPressed() {
    ageString.value = ageEditingController.text;
    if (nameEditingController.text.isEmpty) {
      isValidName.value = true;
    }
    if (ageEditingController.text.isEmpty) {
      isValidAge.value = true;
    }
    if (birthdayEditingController.text.isEmpty) {
      isValidBirthdate.value = true;
    }
    // if (genderEditingController.text.isEmpty) {
    //   isValidGender.value = true;
    // }
    if (dropDownValue.value.isEmpty) {
      isValidGender.value = true;
    }
    if (birthplaceEditingController.text.isEmpty) {
      isValidBirthplace.value = true;
    }
    if (addressEditingController.text.isEmpty) {
      isValidAddress.value = true;
    }
    if (highEducEditingController.text.isEmpty) {
      isValidEduc.value = true;
    }
    if (telNumberEditingController.text.isEmpty) {
      isValidTelNum.value = true;
    }
    if (occupationEditingController.text.isEmpty) {
      isValidOccupation.value = true;
    }
    if (monthlyEditingController.text.isEmpty) {
      isValidAMonthly.value = true;
    }
    if (phoneNumberString.toString().length < 11 ||
        phoneNumberString.toString().length > 11 ||
        !phoneNumberString.toString().startsWith('09')) {
      isValidTelNum.value = true;
    }
    if (totalMonthlyEditingController.text.isEmpty) {
      isValidTotalMonthly.value = true;
      // } else {
      //   Get.toNamed(createupdateinfo2);
    }

    if (isValidName.value == false &&
        isValidAge.value == false &&
        isValidBirthdate.value == false &&
        isValidGender.value == false &&
        isValidBirthplace.value == false &&
        isValidAddress.value == false &&
        isValidEduc.value == false &&
        isValidTelNum.value == false &&
        isValidOccupation.value == false &&
        isValidAMonthly.value == false &&
        isValidTotalMonthly.value == false) {
      Get.toNamed(createupdateinfo2);
    } else {
      return;
    }
  }

  void onNext2Pressed() {
    ageStringI.value = ageIEditingController.text;

    if (nameIEditingController.text.isEmpty) {
      isValidNameI.value = true;
    }
    if (relationIEditingController.text.isEmpty) {
      isValidRelationI.value = true;
    }
    if (ageIEditingController.text.isEmpty) {
      isValidAgeI.value = true;
    }
    if (dropDownStatusValue.value.isEmpty) {
      isValidStatusI.value = true;
    }

    if (educAttainIEditingController.text.isEmpty) {
      isValidEducI.value = true;
    }
    if (occupationIEditingController.text.isEmpty) {
      isValidOccupationI.value = true;
    }
    if (isValidNameI.value == false &&
        isValidRelationI.value == false &&
        isValidAgeI.value == false &&
        isValidStatusI.value == false &&
        isValidEducI.value == false &&
        isValidOccupationI.value == false) {
      Get.toNamed(createupdateinfo3);
    } else {
      return;
    }
  }

  void onCreateRecord(BuildContext context) {
    if (detailsIIEditingController.text.isEmpty) {
      isValidDetailsII.value = true;
    }
    if (detailsIIIEditingController.text.isEmpty) {
      isValidDetailsIII.value = true;
    }
    if (detailsIIVEditingController.text.isEmpty) {
      isValidDetailsIV.value = true;
    }
    if (isCheckCertify.value == false) {
      isCheckCertify.value = false;
      // } else {
      //   ApplicationBottomSheet.applicationBottomSheetMenu(context);
    }
    if (isValidDetailsII.value == false &&
        isValidDetailsIII.value == false &&
        isValidDetailsIV.value == false &&
        isCheckCertify.value == true) {
      ApplicationBottomSheet.applicationBottomSheetMenu(context);
    } else {
      return;
    }
  }

  void clearFields() {
    nameEditingController.text = '';
    ageEditingController.text = '';
    birthdayEditingController.text = '';
    genderEditingController.text = '';
    birthplaceEditingController.text = '';
    addressEditingController.text = '';
    highEducEditingController.text = '';
    telNumberEditingController.text = '';
    occupationEditingController.text = '';
    monthlyEditingController.text = '';
    totalMonthlyEditingController.text = '';

    nameIEditingController.text = '';
    relationIEditingController.text = '';
    ageIEditingController.text = '';
    statusIEditingController.text = '';
    educAttainIEditingController.text = '';
    occupationIEditingController.text = '';

    detailsIIEditingController.text = '';
    detailsIIVEditingController.text = '';

    isValidName.value = false;
    isValidAge.value = false;
    isValidBirthdate.value = false;
    isValidGender.value = false;
    isValidBirthplace.value = false;
    isValidAddress.value = false;
    isValidEduc.value = false;
    isValidTelNum.value = false;
    isValidOccupation.value = false;
    isValidAMonthly.value = false;
    isValidTotalMonthly.value = false;

    isValidNameI.value = false;
    isValidRelationI.value = false;
    isValidAgeI.value = false;
    isValidStatusI.value = false;
    isValidEducI.value = false;
    isValidOccupationI.value = false;

    isValidDetailsII.value = false;
    isValidDetailsIII.value = false;
    isValidDetailsIV.value = false;
    isCheckCertify.value = false;

    ageString.value = '10';
    ageStringI.value = '10';

    dropDownValue.value = '';
    dropDownStatusValue.value = '';
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
  RxList<Gender> genderList = <Gender>[
    Gender(
      id: '1',
      type: 'Female',
    ),
    Gender(
      id: '2',
      type: 'Male',
    ),
  ].obs;
  RxList<Status> statusList = <Status>[
    Status(
      id: '1',
      type: 'Single',
    ),
    Status(
      id: '2',
      type: 'Married',
    ),
    Status(
      id: '2',
      type: 'Separeted',
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

class Gender {
  String? id;
  String? type;

  Gender({
    this.id,
    this.type,
  });
}

class Status {
  String? id;
  String? type;

  Status({
    this.id,
    this.type,
  });
}
