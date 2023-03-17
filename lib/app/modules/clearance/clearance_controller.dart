// ignore_for_file: unnecessary_overrides

import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/clearance/applicationbottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearanceController extends GetxController {
  var businessNameEditingController = TextEditingController();
  var statusEditingController = TextEditingController();
  var unitFloorEditingController = TextEditingController();
  var buildingNameEditingController = TextEditingController();
  var streetAddressEditingController = TextEditingController();
  var streetCornerEditingController = TextEditingController();
  var subdivisionEditingController = TextEditingController();
  var tinEditingController = TextEditingController();
  var dtiRegEditingController = TextEditingController();
  var applicantNameEditingController = TextEditingController();
  var telNumberEditingController = TextEditingController();
  var faxNumberEditingController = TextEditingController();

  var areaEditingController = TextEditingController();
  var businessnatureEditingController = TextEditingController();

  var ownershipEditingController = TextEditingController();
  var ownedEditingController = TextEditingController();
  var plateNoEditingController = TextEditingController();
  var plateFeeEditingController = TextEditingController();
  var noOfOwnersEditingController = TextEditingController();
  var contactNoEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var penaltyEditingController = TextEditingController();
  var discountEditingController = TextEditingController();
  var cashEditingController = TextEditingController();

  RxBool isValidBusinessName = false.obs;
  RxBool isValidUnitFloor = false.obs;
  RxBool isValidTinNo = false.obs;
  RxBool isValidDTIReg = false.obs;
  RxBool isValidApplicantName = false.obs;
  RxBool isValidTelNo = false.obs;
  RxBool isValidFaxNumber = false.obs;
  RxBool isValidAreaofEst = false.obs;
  RxBool isValidPlastNo = false.obs;
  RxBool isValidAMonthly = false.obs;
  RxBool isValidTotalMonthly = false.obs;

  RxBool isValidStatus = false.obs;
  RxBool isValidBuildingName = false.obs;
  RxBool isValidStreetAddress = false.obs;
  RxBool isValidSreetCorner = false.obs;
  RxBool isValidSubdivision = false.obs;
  RxBool isValidOwnership = false.obs;
  RxBool isValidBusinessNature = false.obs;
  RxBool isValidOwned = false.obs;
  RxBool isValidPayment = false.obs;

  RxString dropDownStatusValue = ''.obs;
  RxString dropDownBuildingNameValue = ''.obs;
  RxString dropDownStreetAddressValue = ''.obs;
  RxString dropDownStreetCornerValue = ''.obs;
  RxString dropDownSubdivisionValue = ''.obs;
  RxString dropDownOwnershipValue = ''.obs;
  RxString dropDownBusinessNatureValue = ''.obs;
  RxString dropDownOwendValue = ''.obs;
  RxString dropDownPaymentValue = ''.obs;

  var selectedStatus = Status();
  var selectedBuildingName = BuildingName();
  var selectedStreetAddress = StreetAddress();
  var selectedStreeCorner = StreetCorner();
  var selectedSubdivision = Subdivision();
  var selectedOwnership = Ownership();
  var selectedBusinessNature = BusinessNature();
  var selectedOwned = Owned();
  var selectedPayment = Payment();
  RxString phoneNumberString = '09123456789'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    businessNameEditingController.dispose();
    statusEditingController.dispose();
    unitFloorEditingController.dispose();
    buildingNameEditingController.dispose();
    streetAddressEditingController.dispose();
    streetCornerEditingController.dispose();
    subdivisionEditingController.dispose();
    tinEditingController.dispose();
    dtiRegEditingController.dispose();
    applicantNameEditingController.dispose();
    telNumberEditingController.dispose();
    areaEditingController.dispose();
    businessnatureEditingController.dispose();
    ownershipEditingController.dispose();
    ownedEditingController.dispose();
    plateNoEditingController.dispose();
    plateFeeEditingController.dispose();
    noOfOwnersEditingController.dispose();
    contactNoEditingController.dispose();
    emailEditingController.dispose();
    penaltyEditingController.dispose();
    discountEditingController.dispose();
    cashEditingController.dispose();
    super.dispose();
  }

  void clearfields() {
    businessNameEditingController.text = '';
    statusEditingController.text = '';
    unitFloorEditingController.text = '';
    buildingNameEditingController.text = '';
    streetAddressEditingController.text = '';
    streetCornerEditingController.text = '';
    subdivisionEditingController.text = '';
    tinEditingController.text = '';
    dtiRegEditingController.text = '';
    applicantNameEditingController.text = '';
    telNumberEditingController.text = '';
    faxNumberEditingController.text = '';
    areaEditingController.text = '';
    businessnatureEditingController.text = '';
    ownershipEditingController.text = '';
    ownedEditingController.text = '';
    plateNoEditingController.text = '';
    plateFeeEditingController.text = '';
    noOfOwnersEditingController.text = '';
    contactNoEditingController.text = '';
    emailEditingController.text = '';
    penaltyEditingController.text = '';
    discountEditingController.text = '';
    cashEditingController.text = '';

    isValidBusinessName.value = false;
    isValidUnitFloor.value = false;
    isValidTinNo.value = false;
    isValidDTIReg.value = false;
    isValidApplicantName.value = false;
    isValidTelNo.value = false;
    isValidFaxNumber.value = false;
    isValidAreaofEst.value = false;
    isValidPlastNo.value = false;
    isValidAMonthly.value = false;
    isValidTotalMonthly.value = false;

    isValidStatus.value = false;
    isValidBuildingName.value = false;
    isValidStreetAddress.value = false;
    isValidSreetCorner.value = false;
    isValidSubdivision.value = false;
    isValidOwnership.value = false;
    isValidBusinessNature.value = false;
    isValidOwned.value = false;
    isValidPayment.value = false;

    dropDownStatusValue.value = '';
    dropDownBuildingNameValue.value = '';
    dropDownStreetAddressValue.value = '';
    dropDownStreetCornerValue.value = '';
    dropDownSubdivisionValue.value = '';
    dropDownOwnershipValue.value = '';
    dropDownBusinessNatureValue.value = '';
    dropDownOwendValue.value = '';
    dropDownPaymentValue.value = '';
  }

  void onCreateRecord(BuildContext context) {
    phoneNumberString.value = telNumberEditingController.text;
    if (dropDownStatusValue.value.isEmpty) {
      isValidStatus.value = true;
    } else {
      isValidStatus.value = false;
    }
    if (dropDownBuildingNameValue.value.isEmpty) {
      isValidBuildingName.value = true;
    } else {
      isValidBuildingName.value = false;
    }
    if (dropDownStreetAddressValue.value.isEmpty) {
      isValidStreetAddress.value = true;
    } else {
      isValidStreetAddress.value = false;
    }
    if (dropDownStreetCornerValue.value.isEmpty) {
      isValidSreetCorner.value = true;
    } else {
      isValidSreetCorner.value = false;
    }
    if (dropDownSubdivisionValue.value.isEmpty) {
      isValidSubdivision.value = true;
    } else {
      isValidSubdivision.value = false;
    }
    if (dropDownOwnershipValue.value.isEmpty) {
      isValidOwnership.value = true;
    } else {
      isValidOwnership.value = false;
    }
    if (dropDownBusinessNatureValue.value.isEmpty) {
      isValidBusinessNature.value = true;
    } else {
      isValidBusinessNature.value = false;
    }
    if (dropDownOwendValue.value.isEmpty) {
      isValidOwned.value = true;
    } else {
      isValidOwned.value = false;
    }
    if (dropDownPaymentValue.value.isEmpty) {
      isValidPayment.value = true;
    } else {
      isValidPayment.value = false;
    }
    if (businessNameEditingController.text.isEmpty) {
      isValidBusinessName.value = true;
    } else {
      isValidBusinessName.value = false;
    }
    if (unitFloorEditingController.text.isEmpty) {
      isValidUnitFloor.value = true;
    } else {
      isValidUnitFloor.value = false;
    }
    if (tinEditingController.text.isEmpty) {
      isValidTinNo.value = true;
    } else {
      isValidTinNo.value = false;
    }
    if (dtiRegEditingController.text.isEmpty) {
      isValidDTIReg.value = true;
    } else {
      isValidDTIReg.value = false;
    }
    if (applicantNameEditingController.text.isEmpty) {
      isValidApplicantName.value = true;
    } else {
      isValidAMonthly.value = false;
    }
    if (telNumberEditingController.text.isEmpty) {
      isValidTelNo.value = true;
    } else {
      isValidTelNo.value = false;
    }
    if (faxNumberEditingController.text.isEmpty) {
      isValidFaxNumber.value = true;
    } else {
      isValidFaxNumber.value = false;
    }
    if (areaEditingController.text.isEmpty) {
      isValidAreaofEst.value = true;
    } else {
      isValidAreaofEst.value = false;
    }
    if (phoneNumberString.toString().length < 11 ||
        phoneNumberString.toString().length > 11 ||
        !phoneNumberString.toString().startsWith('09')) {
      isValidTelNo.value = true;
    } else {
      isValidTelNo.value = false;
    }

    if (isValidBusinessName.value == false &&
        isValidUnitFloor.value == false &&
        isValidTinNo.value == false &&
        isValidDTIReg.value == false &&
        isValidApplicantName.value == false &&
        isValidTelNo.value == false &&
        isValidFaxNumber.value == false) {
      ApplicationBottomSheet.applicationBottomSheetMenu(context);
    } else {
      return;
    }
  }

  RxBool isUpdate = false.obs;
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
  RxList<Status> statusList = <Status>[
    Status(
      id: '1',
      type: 'Status 1',
    ),
    Status(
      id: '2',
      type: 'Status 2',
    ),
    Status(
      id: '3',
      type: 'Status 3',
    ),
    Status(
      id: '4',
      type: 'Status 4',
    ),
  ].obs;
  RxList<BuildingName> buildingNameList = <BuildingName>[
    BuildingName(
      id: '1',
      type: 'Building 1',
    ),
    BuildingName(
      id: '2',
      type: 'Building 2',
    ),
    BuildingName(
      id: '3',
      type: 'Building 3',
    ),
  ].obs;
  RxList<StreetAddress> streetAddressList = <StreetAddress>[
    StreetAddress(
      id: '1',
      type: 'Street Address 1',
    ),
    StreetAddress(
      id: '2',
      type: 'Street Address 2 ',
    ),
    StreetAddress(
      id: '3',
      type: 'Street Address 3',
    ),
    StreetAddress(
      id: '4',
      type: 'Street Address 4',
    ),
  ].obs;
  RxList<StreetCorner> streetCornerList = <StreetCorner>[
    StreetCorner(
      id: '1',
      type: 'Street Corner 1',
    ),
    StreetCorner(
      id: '2',
      type: 'Street Corner 2',
    ),
    StreetCorner(
      id: '3',
      type: 'Street Corner 3',
    ),
    StreetCorner(
      id: '4',
      type: 'Street Corner 4',
    ),
    StreetCorner(
      id: '5',
      type: 'Street Corner 5',
    ),
  ].obs;
  RxList<Subdivision> subdvisionList = <Subdivision>[
    Subdivision(
      id: '1',
      type: 'Subdivision 1',
    ),
    Subdivision(
      id: '2',
      type: 'Subdivision 2',
    ),
    Subdivision(
      id: '3',
      type: 'Subdivision 3',
    ),
    Subdivision(
      id: '4',
      type: 'Subdivision 4',
    ),
    Subdivision(
      id: '5',
      type: 'Subdivision 5',
    ),
    Subdivision(
      id: '6',
      type: 'Subdivision 6',
    ),
    Subdivision(
      id: '7',
      type: 'Subdivision 7',
    ),
  ].obs;
  RxList<Ownership> ownershipList = <Ownership>[
    Ownership(
      id: '1',
      type: 'Full Time',
    ),
    Ownership(
      id: '2',
      type: 'Part Time',
    ),
  ].obs;
  RxList<BusinessNature> businessNatureList = <BusinessNature>[
    BusinessNature(
      id: '1',
      type: 'Legal',
    ),
    BusinessNature(
      id: '2',
      type: 'Illegal',
    ),
  ].obs;
  RxList<Owned> ownedList = <Owned>[
    Owned(
      id: '1',
      type: 'Yes',
    ),
    Owned(
      id: '2',
      type: 'No',
    ),
    Owned(
      id: '3',
      type: 'Maybe',
    ),
  ].obs;
  RxList<Payment> paymentList = <Payment>[
    Payment(
      id: '1',
      type: 'Cash',
    ),
    Payment(
      id: '2',
      type: 'GCash',
    ),
    Payment(
      id: '3',
      type: 'Maya',
    ),
    Payment(
      id: '4',
      type: 'Card',
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

class Status {
  String? id;
  String? type;

  Status({
    this.id,
    this.type,
  });
}

class BuildingName {
  String? id;
  String? type;

  BuildingName({
    this.id,
    this.type,
  });
}

class StreetAddress {
  String? id;
  String? type;

  StreetAddress({
    this.id,
    this.type,
  });
}

class StreetCorner {
  String? id;
  String? type;

  StreetCorner({
    this.id,
    this.type,
  });
}

class Subdivision {
  String? id;
  String? type;

  Subdivision({
    this.id,
    this.type,
  });
}

class Ownership {
  String? id;
  String? type;

  Ownership({
    this.id,
    this.type,
  });
}

class BusinessNature {
  String? id;
  String? type;

  BusinessNature({
    this.id,
    this.type,
  });
}

class Owned {
  String? id;
  String? type;

  Owned({
    this.id,
    this.type,
  });
}

class Payment {
  String? id;
  String? type;

  Payment({
    this.id,
    this.type,
  });
}
