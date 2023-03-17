// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
// import 'package:iloilocityapp/app/modules/clearance/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/modules/clearance/clearance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateClearanceView extends GetView<ClearanceController> {
  const CreateUpdateClearanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClearanceController());
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
                              'BRGY. CLEARANCE',
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
                    'Enter the information in the requried fields',
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
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Registered Name of Business Establishment',
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller:
                                controller.businessNameEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidBusinessName.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidBusinessName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Business Name*',
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
                            child: DropdownButton<Status>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownStatusValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Status*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedStatus.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                                  controller.statusList.map((Status? status) {
                                return DropdownMenuItem<Status>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Status? newValue) {
                                controller.isValidStatus.value = true;
                                controller.selectedStatus = newValue!;
                                controller.dropDownStatusValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidStatus.value &&
                                controller.dropDownStatusValue.isEmpty
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
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Business Address',
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12),
                          child: TextField(
                            controller: controller.unitFloorEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidUnitFloor.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidUnitFloor.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Unit Floor No.*',
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
                            child: DropdownButton<BuildingName>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller
                                        .dropDownBuildingNameValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Building Name*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedBuildingName.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.buildingNameList
                                  .map((BuildingName? status) {
                                return DropdownMenuItem<BuildingName>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (BuildingName? newValue) {
                                controller.isValidBuildingName.value = true;
                                controller.selectedBuildingName = newValue!;
                                controller.dropDownBuildingNameValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidBuildingName.value &&
                                controller.dropDownBuildingNameValue.isEmpty
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<StreetAddress>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller
                                        .dropDownStreetAddressValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Street Address*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller
                                              .selectedStreetAddress.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.streetAddressList
                                  .map((StreetAddress? status) {
                                return DropdownMenuItem<StreetAddress>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (StreetAddress? newValue) {
                                controller.isValidStreetAddress.value = true;
                                controller.selectedStreetAddress = newValue!;
                                controller.dropDownStreetAddressValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidStreetAddress.value &&
                                controller.dropDownStreetAddressValue.isEmpty
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<StreetCorner>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller
                                        .dropDownStreetCornerValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Street Corner*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedStreeCorner.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.streetCornerList
                                  .map((StreetCorner? status) {
                                return DropdownMenuItem<StreetCorner>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (StreetCorner? newValue) {
                                controller.isValidSreetCorner.value = true;
                                controller.selectedStreeCorner = newValue!;
                                controller.dropDownStreetCornerValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidSreetCorner.value &&
                                controller.dropDownStreetCornerValue.isEmpty
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<Subdivision>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller
                                        .dropDownSubdivisionValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Subdivision*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedSubdivision.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.subdvisionList
                                  .map((Subdivision? status) {
                                return DropdownMenuItem<Subdivision>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Subdivision? newValue) {
                                controller.isValidSubdivision.value = true;
                                controller.selectedSubdivision = newValue!;
                                controller.dropDownSubdivisionValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidSubdivision.value &&
                                controller.dropDownSubdivisionValue.isEmpty
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
                            controller: controller.tinEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidTinNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidTinNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Tax Payer Identification No.*',
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
                            controller: controller.dtiRegEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDTIReg.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidDTIReg.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'SEC/DTI Registration No.*',
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
                                controller.applicantNameEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidApplicantName.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidApplicantName.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Applicant/Representative Name.*',
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
                              controller.isValidTelNo.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidTelNo.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Telephone Number.*',
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
                            controller: controller.faxNumberEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidFaxNumber.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidFaxNumber.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Fax Number.*',
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
                            controller: controller.areaEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidAreaofEst.value = false;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidAreaofEst.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Area of Est. (in sq.m)*',
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
                            child: DropdownButton<Ownership>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownOwnershipValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Business Ownership*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedOwnership.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.ownershipList
                                  .map((Ownership? status) {
                                return DropdownMenuItem<Ownership>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Ownership? newValue) {
                                controller.isValidOwnership.value = true;
                                controller.selectedOwnership = newValue!;
                                controller.dropDownOwnershipValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidOwnership.value &&
                                controller.dropDownOwnershipValue.isEmpty
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<BusinessNature>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller
                                        .dropDownBusinessNatureValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Choose Nature of Business*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller
                                              .selectedBusinessNature.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                              items: controller.businessNatureList
                                  .map((BusinessNature? status) {
                                return DropdownMenuItem<BusinessNature>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (BusinessNature? newValue) {
                                controller.isValidBusinessNature.value = true;
                                controller.selectedBusinessNature = newValue!;
                                controller.dropDownBusinessNatureValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidBusinessNature.value &&
                                controller.dropDownBusinessNatureValue.isEmpty
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<Owned>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownOwendValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Owned*',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedOwned.type!,
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                              ),
                              isExpanded: true,
                              iconEnabledColor: primaryColor,
                              icon: const ImageIcon(
                                AssetImage(AssetsPath.dropDown),
                                size: 35,
                              ).paddingOnly(right: 4),
                              style: const TextStyle(color: Colors.black),
                              items: controller.ownedList.map((Owned? status) {
                                return DropdownMenuItem<Owned>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Owned? newValue) {
                                controller.isValidOwned.value = true;
                                controller.selectedOwned = newValue!;
                                controller.dropDownOwendValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidOwned.value &&
                                controller.dropDownOwendValue.isEmpty
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: TextField(
                          controller: controller.plateNoEditingController,
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
                            hintText: 'Business Plate No.',
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
                          controller: controller.plateFeeEditingController,
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
                            hintText: 'Business Plate Fee',
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
                          controller: controller.noOfOwnersEditingController,
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
                            hintText: 'Number of Owner',
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
                          controller: controller.contactNoEditingController,
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
                            hintText: 'Contact Number of Owner',
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
                          controller: controller.emailEditingController,
                          onEditingComplete: () => node.nextFocus(),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                            hintText: 'Email of Owner',
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
                          controller: controller.penaltyEditingController,
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
                            hintText: 'Penalty',
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
                          controller: controller.discountEditingController,
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
                            hintText: 'Discount',
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
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffF5F5F5),
                            ),
                            child: DropdownButton<Payment>(
                              dropdownColor: Colors.white,
                              underline: const SizedBox.shrink(),
                              hint: Obx(
                                () => controller.dropDownPaymentValue.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          'Payment',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 24),
                                        child: Text(
                                          controller.selectedPayment.type!,
                                          style: TextStyle(
                                            color: primaryColor,
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
                                  controller.paymentList.map((Payment? status) {
                                return DropdownMenuItem<Payment>(
                                  value: status,
                                  child: Text(
                                    status!.type!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ), //snapshot.data![0].name, //snapshot.data!.group!.name,
                                );
                              }).toList(),
                              onChanged: (Payment? newValue) {
                                controller.isValidPayment.value = true;
                                controller.selectedPayment = newValue!;
                                controller.dropDownPaymentValue.value =
                                    newValue.type.toString();
                                // node.unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isValidPayment.value &&
                                controller.dropDownPaymentValue.isEmpty
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
                    ],
                  ),
                ),
              )
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
            color: successButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              // Get.toNamed(createupdateinfo3);
              // ApplicationBottomSheet.applicationBottomSheetMenu(context);
              controller.onCreateRecord(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.isUpdate.value == false
                        ? 'CREATE RECORD'
                        : 'SAVE CHANGES',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
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
