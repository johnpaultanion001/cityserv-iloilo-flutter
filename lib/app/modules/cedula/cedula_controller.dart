import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/cedula/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CedulaController extends GetxController {
  RxBool isUpdate = false.obs;
  var isChecked = RxList<bool>().obs;

  var yearEditingController = TextEditingController();
  var placeIssuedEditingController = TextEditingController();
  var dateIssuedEditingController = TextEditingController();
  var tinEditingController = TextEditingController();
  var givenNameEditingController = TextEditingController();
  var middleNameEditingController = TextEditingController();
  var lastNameEditingController = TextEditingController();
  var sexEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var citizenshipEditingController = TextEditingController();
  var icrNoEditingController = TextEditingController();
  var birthPlaceEditingController = TextEditingController();

  var birthdateEditingController = TextEditingController();
  var heightEditingController = TextEditingController();
  var weightEditingController = TextEditingController();
  var occupationEditingController = TextEditingController();

  var basicCedulaEditingController = TextEditingController();
  var addCedula1EditingController = TextEditingController();
  var addCedula2EditingController = TextEditingController();
  var addCedula3EditingController = TextEditingController();

  var totalEditingController = TextEditingController();
  var interestEditingController = TextEditingController();
  var grandTotalEditingController = TextEditingController();

  RxBool isValidGivenName = false.obs;
  RxBool isValidLastName = false.obs;
  RxBool isValidSex = false.obs;
  RxBool isValidAddress = false.obs;
  RxBool isValidICRNo = false.obs;
  RxBool isValidBirthplace = false.obs;
  RxBool isValidBirthdate = false.obs;
  RxBool isValidHeight = false.obs;
  RxBool isValidWeight = false.obs;
  RxBool isValidOccupation = false.obs;
  RxBool isValidStatus = false.obs;

  RxBool isValidBasicCedula = false.obs;
  RxBool isValidAddCedula1 = false.obs;
  RxBool isValidAddCedula2 = false.obs;
  RxBool isValidAddCedula3 = false.obs;

  RxString dropDownValue = ''.obs;
  RxString selectedStatus = ''.obs;
  var selectedGender = Gender();
  RxList<String> civilStatus = [
    'Single',
    'Married',
    'Widowed /Widower Legally Separated',
    'Divorced',
  ].obs;

  @override
  void onInit() {
    isChecked.value = RxList<bool>.filled(civilStatus.length, false);
    super.onInit();
  }

  @override
  void dispose() {
    yearEditingController.dispose();
    placeIssuedEditingController.dispose();
    dateIssuedEditingController.dispose();
    tinEditingController.dispose();
    givenNameEditingController.dispose();
    middleNameEditingController.dispose();
    lastNameEditingController.dispose();
    sexEditingController.dispose();
    addressEditingController.dispose();
    citizenshipEditingController.dispose();
    icrNoEditingController.dispose();
    birthPlaceEditingController.dispose();
    birthdateEditingController.dispose();
    heightEditingController.dispose();
    weightEditingController.dispose();
    occupationEditingController.dispose();
    basicCedulaEditingController.dispose();
    addCedula1EditingController.dispose();
    addCedula2EditingController.dispose();
    addCedula3EditingController.dispose();
    totalEditingController.dispose();
    interestEditingController.dispose();
    grandTotalEditingController.dispose();
    super.dispose();
  }

  void clearFields() {
    yearEditingController.text = '2022';
    placeIssuedEditingController.text = 'Salinas 1';
    dateIssuedEditingController.text = DateTime.now().toLocal().toString();
    tinEditingController.text = '';
    givenNameEditingController.text = '';
    middleNameEditingController.text = '';
    lastNameEditingController.text = '';
    sexEditingController.text = '';
    addressEditingController.text = '';
    citizenshipEditingController.text = 'Filipino';
    icrNoEditingController.text = '';
    birthPlaceEditingController.text = '';
    birthdateEditingController.text = '';
    heightEditingController.text = '';
    weightEditingController.text = '';
    occupationEditingController.text = '';
    basicCedulaEditingController.text = '';
    addCedula1EditingController.text = '';
    addCedula2EditingController.text = '';
    addCedula3EditingController.text = '';
    totalEditingController.text = '';
    interestEditingController.text = '';
    grandTotalEditingController.text = '';

    isValidGivenName.value = false;
    isValidLastName.value = false;
    isValidSex.value = false;
    isValidAddress.value = false;
    isValidICRNo.value = false;
    isValidBirthplace.value = false;
    isValidBirthdate.value = false;
    isValidHeight.value = false;
    isValidWeight.value = false;
    isValidOccupation.value = false;

    isValidBasicCedula.value = false;
    isValidAddCedula1.value = false;
    isValidAddCedula2.value = false;
    isValidAddCedula3.value = false;

    selectedStatus.value = '';
    dropDownValue.value = '';
  }

  void onNextPressed() {
    if (givenNameEditingController.text.isEmpty) {
      isValidGivenName.value = true;
    }
    if (lastNameEditingController.text.isEmpty) {
      isValidLastName.value = true;
    }
    if (dropDownValue.value.isEmpty) {
      isValidSex.value = true;
    } else {
      isValidSex.value = false;
    }
    if (addressEditingController.text.isEmpty) {
      isValidAddress.value = true;
    }
    if (icrNoEditingController.text.isEmpty) {
      isValidICRNo.value = true;
    }
    if (birthPlaceEditingController.text.isEmpty) {
      isValidBirthplace.value = true;
    }
    if (birthdateEditingController.text.isEmpty) {
      isValidBirthdate.value = true;
    }
    if (heightEditingController.text.isEmpty) {
      isValidHeight.value = true;
    }
    if (weightEditingController.text.isEmpty) {
      isValidWeight.value = true;
    }
    if (occupationEditingController.text.isEmpty) {
      isValidOccupation.value = true;
    }
    if (selectedStatus.value.isEmpty) {
      isValidStatus.value = true;
    }

    if (isValidGivenName.value == false &&
        isValidLastName.value == false &&
        isValidSex.value == false &&
        isValidAddress.value == false &&
        isValidICRNo.value == false &&
        isValidBirthplace.value == false &&
        isValidBirthdate.value == false &&
        isValidHeight.value == false &&
        isValidWeight.value == false &&
        isValidOccupation.value == false &&
        isValidStatus.value == false) {
      Get.toNamed(createupdatecedula2);
    } else {
      return;
    }
  }

  void onCreateRecord(BuildContext context) {
    if (basicCedulaEditingController.text.isEmpty) {
      isValidBasicCedula.value = true;
    }
    if (addCedula1EditingController.text.isEmpty) {
      isValidAddCedula1.value = true;
    }
    if (addCedula2EditingController.text.isEmpty) {
      isValidAddCedula2.value = true;
    }
    if (addCedula3EditingController.text.isEmpty) {
      isValidAddCedula3.value = true;
    }
    if (isValidBasicCedula.value == false &&
        isValidAddCedula1.value == false &&
        isValidAddCedula2.value == false &&
        isValidAddCedula3.value == false) {
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
