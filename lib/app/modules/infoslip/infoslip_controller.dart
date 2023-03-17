// ignore_for_file: unnecessary_overrides

import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/infoslip/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSlipController extends GetxController {
  RxBool isUpdate = false.obs;
  var isChecked = RxList<bool>().obs;

  var dateEditingController = TextEditingController();
  var crtlNumberEditingController = TextEditingController();
  var nameEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var birthdateEditingController = TextEditingController();
  var ageEditingController = TextEditingController();
  var birthplaceEditingController = TextEditingController();
  var yearsEditingController = TextEditingController();
  var contactEditingController = TextEditingController();
  var approvedEditingController = TextEditingController();
  var disapprovedEditingController = TextEditingController();

  RxBool isValidName = false.obs;
  RxBool isValidAddress = false.obs;
  RxBool isValidBirthdate = false.obs;
  RxBool isValidAge = false.obs;
  RxBool isValidBirthplace = false.obs;
  RxBool isValidYears = false.obs;
  RxBool isValidContactNo = false.obs;
  RxBool isValidServices = false.obs;
  var selectedServices = RxList<String>().obs;
  RxString contactNumberString = '09123456789'.obs;

  RxList<String> services = [
    'Issuance of Barangay Clearance / Certificate',
    'Issuance of Excavation / Building / Renovation Permit',
    'Issuance of Barangay Business Clearance',
    'Issuance of Community Tax Certificate',
    'Reproduction of Barangay Records / Data',
    'Issuance of Certification for Solo Parent / Senior Citizen / Indigency / Fact of Birth / Residency / Calamity / Unemployed',
  ].obs;

  @override
  void onInit() {
    isChecked.value = RxList<bool>.filled(services.length, false);

    // if (isUpdate.value == true) {
    //   dateEditingController.text = '5/2/2022';
    //   crtlNumberEditingController.text = '#0001';
    //   nameEditingController.text = 'Juan Dela Cruz';
    //   addressEditingController.text = 'Zone 1, Punta, Bonbon, Cagayan de Oro City, Misamis Oriental';
    //   birthdateEditingController.text = '4/29/2022';
    //   ageEditingController.text = '30';
    //   birthplaceEditingController.text = 'Cagayan de Oro City';
    //   yearsEditingController.text = '30';
    //   contactEditingController.text = '09123456789';
    //   approvedEditingController.text = 'Approved';
    //   disapprovedEditingController.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod';
    // } else {
    //   dateEditingController.text = '2022';
    //   crtlNumberEditingController.text = '';
    //   nameEditingController.text = '';
    //   addressEditingController.text = '';
    //   birthdateEditingController.text = '';
    //   ageEditingController.text = '';
    //   birthplaceEditingController.text = '';
    //   yearsEditingController.text = '';
    //   contactEditingController.text = '';
    //   approvedEditingController.text = '';
    //   disapprovedEditingController.text = '';
    // }
    super.onInit();
  }

  @override
  void dispose() {
    dateEditingController.dispose();
    crtlNumberEditingController.dispose();
    nameEditingController.dispose();
    addressEditingController.dispose();
    birthdateEditingController.dispose();
    ageEditingController.dispose();
    birthplaceEditingController.dispose();
    yearsEditingController.dispose();
    contactEditingController.dispose();
    approvedEditingController.dispose();
    disapprovedEditingController.dispose();
    super.dispose();
  }

  void clearFields() {
    dateEditingController.text = '2022';
    crtlNumberEditingController.text = '#00001';
    nameEditingController.text = '';
    addressEditingController.text = '';
    birthdateEditingController.text = '';
    ageEditingController.text = '';
    birthplaceEditingController.text = '';
    yearsEditingController.text = '';
    contactEditingController.text = '';
    approvedEditingController.text = '';
    disapprovedEditingController.text = '';
    isValidName.value = false;
    isValidAddress.value = false;
    isValidBirthdate.value = false;
    isValidAge.value = false;
    isValidBirthplace.value = false;
    isValidYears.value = false;
    isValidContactNo.value = false;
    isValidServices.value = false;
    selectedServices.value.clear();
  }

  void onNextPressed() {
    contactNumberString.value = contactEditingController.text;
    if (nameEditingController.text.isEmpty) {
      isValidName.value = true;
    }
    if (addressEditingController.text.isEmpty) {
      isValidAddress.value = true;
    }
    if (birthdateEditingController.text.isEmpty) {
      isValidBirthdate.value = true;
    }
    if (ageEditingController.text.isEmpty) {
      isValidAge.value = true;
    }
    if (birthplaceEditingController.text.isEmpty) {
      isValidBirthplace.value = true;
    }
    if (yearsEditingController.text.isEmpty) {
      isValidYears.value = true;
    }
    if (contactEditingController.text.isEmpty) {
      isValidContactNo.value = true;
    }

    if (contactNumberString.toString().length < 11 ||
        contactNumberString.toString().length > 11 ||
        !contactNumberString.toString().startsWith('09')) {
      isValidContactNo.value = true;
    }
    if (isValidName.value == false &&
        isValidAddress.value == false &&
        isValidBirthdate.value == false &&
        isValidAge.value == false &&
        isValidBirthplace.value == false &&
        isValidBirthdate.value == false &&
        isValidYears.value == false &&
        isValidYears.value == false &&
        isValidContactNo.value == false) {
      Get.toNamed(createupdateslip2);
    } else {
      return;
    }
  }

  void onCreateRecord(BuildContext context) {
    if (selectedServices.value.isEmpty) {
      // isValidServices.value = true;
      return;
    } else {
      ApplicationBottomSheet.applicationBottomSheetMenu(
          context); // isValidServices.value = false;
    }
  }

  // void isUpdated() {
  //   if (isUpdate.value == true) {
  //     dateEditingController.text = '2022';
  //     crtlNumberEditingController.text = '#0001';
  //     nameEditingController.text = 'Juan Dela Cruz';
  //     addressEditingController.text = 'Zone 1, Punta, Bonbon, Cagayan de Oro City, Misamis Oriental';
  //     birthdateEditingController.text = '4/29/2022';
  //     ageEditingController.text = '30';
  //     birthplaceEditingController.text = 'Cagayan de Oro City';
  //     yearsEditingController.text = '30';
  //     contactEditingController.text = '09123456789';
  //     approvedEditingController.text = 'Approved';
  //     disapprovedEditingController.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod';
  //   } else {
  //     dateEditingController.text = '2022';
  //     crtlNumberEditingController.text = '';
  //     nameEditingController.text = '';
  //     addressEditingController.text = '';
  //     birthdateEditingController.text = '';
  //     ageEditingController.text = '';
  //     birthplaceEditingController.text = '';
  //     yearsEditingController.text = '';
  //     contactEditingController.text = '';
  //     approvedEditingController.text = '';
  //     disapprovedEditingController.text = '';
  //   }
  // }

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
