// ignore_for_file: empty_catches, deprecated_member_use

import 'dart:io';

import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/incident/applicationbottom_sheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IncidentReportController extends GetxController {
  RxBool isUpdate = false.obs;

  var caseNumberEditingController = TextEditingController();
  var natureCaseEditingController = TextEditingController();
  var caseDescEditingController = TextEditingController();
  var complainDateEditingController = TextEditingController();
  var filedDateEditingController = TextEditingController();
  var complainNameEditingController = TextEditingController();
  var phoneNumberEditingController = TextEditingController();

  RxString filenameimageprofile = "".obs;
  RxString fileTypeimageprofile = "".obs;
  RxBool isImageSelected = false.obs;
  RxBool isLoading = false.obs;
  File? image;

  final picker = ImagePicker();
  var selectedCase = Case();
  RxString dropDownCaseValue = ''.obs;
  RxBool isValidCase = false.obs;
  RxBool isValidCaseError = false.obs;
  RxBool isValidDesc = false.obs;
  RxBool isValidDateComp = false.obs;
  RxBool isValidDateFiled = false.obs;
  RxBool isValidName = false.obs;
  RxBool isValidNumber = false.obs;
  RxBool isEmptyImage = false.obs;

  RxString phoneNumberString = '09123456789'.obs;
  // RxString caseNumber = '#0000001'.obs;

  @override
  void onInit() {
    caseNumberEditingController.text = '#0000001';
    // if (isUpdate.value == true) {
    //   caseNumberEditingController.text = '00001';
    //   natureCaseEditingController.text = 'CIVIL';
    //   caseDescEditingController.text = 'Enter Report Details Here, may it be 1 to 2 sencentes to give a summary of the report to the LGU.';
    //   complainDateEditingController.text = '4/29/2022';
    //   filedDateEditingController.text = '4/29/2022';
    //   complainNameEditingController.text = 'Juan Dela Cruz';
    //   phoneNumberEditingController.text = '09123456789';
    // } else {
    //   caseNumberEditingController.text = '#0000001';
    //   natureCaseEditingController.text = '';
    //   caseDescEditingController.text = '';
    //   complainDateEditingController.text = '';
    //   filedDateEditingController.text = '';
    //   complainNameEditingController.text = '';
    //   phoneNumberEditingController.text = '';
    // }
    super.onInit();
  }

  @override
  void dispose() {
    caseNumberEditingController.dispose();
    natureCaseEditingController.dispose();
    caseDescEditingController.dispose();
    complainDateEditingController.dispose();
    filedDateEditingController.dispose();
    complainNameEditingController.dispose();
    phoneNumberEditingController.dispose();
    super.dispose();
  }

  void onSubmitReport(BuildContext context) {
    phoneNumberString.value = phoneNumberEditingController.text;
    if (image == null) {
      isEmptyImage.value = true;
    } else {
      isEmptyImage.value = false;
    }
    if (natureCaseEditingController.text.isEmpty) {
      isValidCase.value = true;
    } else {
      isValidCaseError.value = false;
    }
    if (caseDescEditingController.text.isEmpty) {
      isValidDesc.value = true;
    } else {
      isValidDesc.value = false;
    }
    if (complainDateEditingController.text.isEmpty) {
      isValidDateComp.value = true;
    } else {
      isValidDateComp.value = false;
    }
    if (filedDateEditingController.text.isEmpty) {
      isValidDateFiled.value = true;
    } else {
      isValidDateFiled.value = false;
    }
    if (complainNameEditingController.text.isEmpty) {
      isValidName.value = true;
    } else {
      isValidName.value = false;
    }
    if (phoneNumberEditingController.text.isEmpty) {
      isValidNumber.value = true;
    } else {
      isValidNumber.value = false;
    }
    if (phoneNumberString.toString().length < 11 ||
        phoneNumberString.toString().length > 11 ||
        !phoneNumberString.toString().startsWith('09')) {
      isValidNumber.value = true;
    } else {
      isValidNumber.value = false;
    }

    if (isEmptyImage.value == false &&
        isValidCaseError.value == false &&
        isValidDesc.value == false &&
        isValidDateComp.value == false &&
        isValidDateFiled.value == false &&
        isValidName.value == false &&
        isValidNumber.value == false) {
      ApplicationBottomSheet.applicationBottomSheetMenu(context);
    } else {
      return;
    }
  }

  void clearFields() {
    image = null;
    dropDownCaseValue.value = '';
    caseNumberEditingController.text = '';
    natureCaseEditingController.text = '';
    caseDescEditingController.text = '';
    complainDateEditingController.text = '';
    filedDateEditingController.text = '';
    complainNameEditingController.text = '';
    phoneNumberEditingController.text = '';
    filenameimageprofile.value = "";
    fileTypeimageprofile.value = "";
    isImageSelected.value = false;
    isValidCase.value = false;
    isValidCaseError.value = false;
    isValidDesc.value = false;
    isValidDateComp.value = false;
    isValidDateFiled.value = false;
    isValidName.value = false;
    isValidNumber.value = false;
    isEmptyImage.value = false;
  }

  Future getFileImage() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (pickedFile != null) {
      final File imgprofile = File(pickedFile.files.single.path!);

      try {
        image = imgprofile;
        final String filenamewholeimge = imgprofile.path.split('/').last;
        final splitTheimage = filenamewholeimge.split('.');
        filenameimageprofile.value = splitTheimage[0];
        fileTypeimageprofile.value = splitTheimage[1];
        isEmptyImage.value = false;
      } catch (e) {}
    } else {}
  }

  Future getCameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final File imgprofile1 = File(pickedFile.path);
      try {
        image = imgprofile1;
        final String filenamewholeimge1 = imgprofile1.path.split('/').last;
        final splitTheimage1 = filenamewholeimge1.split('.');

        filenameimageprofile.value = splitTheimage1[0];
        filenameimageprofile.value = splitTheimage1[1];
        isEmptyImage.value = false;
      } catch (e) {}
    }
  }

  RxList<Reports> reportList = <Reports>[
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '5 mins ago',
      status: 'Pending',
    ),
    Reports(
      id: '2',
      title: 'Report Name Here',
      image: AssetsPath.imageData2,
      date: '3 weeks ago',
      status: 'Resolved',
    ),
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '1 Month ago',
      status: 'Pending',
    ),
    Reports(
      id: '2',
      title: 'Report Name Here',
      image: AssetsPath.imageData2,
      date: '3 Months ago',
      status: 'Resolved',
    ),
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '10/11/2021',
      status: 'On Trail',
    ),
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '5 mins ago',
      status: 'Pending',
    ),
    Reports(
      id: '2',
      title: 'Report Name Here',
      image: AssetsPath.imageData2,
      date: '3 weeks ago',
      status: 'Resolved',
    ),
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '1 Month ago',
      status: 'Pending',
    ),
    Reports(
      id: '2',
      title: 'Report Name Here',
      image: AssetsPath.imageData2,
      date: '3 Months ago',
      status: 'Resolved',
    ),
    Reports(
      id: '1',
      title: 'Report Name Here',
      image: AssetsPath.imageData1,
      date: '10/11/2021',
      status: 'On Trail',
    ),
  ].obs;
  RxList<Case> casesList = <Case>[
    Case(
      id: '1',
      type: 'Crime',
    ),
    Case(
      id: '2',
      type: 'Fire',
    ),
    Case(
      id: '3',
      type: 'Civil',
    ),
    Case(
      id: '4',
      type: 'OTH',
    ),
  ].obs;
}

class Reports {
  String? id;
  String? title;
  String? image;
  String? date;
  String? status;

  Reports({this.id, this.title, this.image, this.date, this.status});
}

class Case {
  String? id;
  String? type;

  Case({
    this.id,
    this.type,
  });
}
