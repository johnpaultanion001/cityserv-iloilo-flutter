// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_controller.dart';
// import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateInfoView2 extends GetView<SoloParentController> {
  const CreateUpdateInfoView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SoloParentController());
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              'SOLO PARENT',
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
              ).paddingOnly(top: 24, right: 24, bottom: 24, left: 8),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I. Family Composition',
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ).paddingSymmetric(horizontal: 24, vertical: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '"Inclue Family Members and other members of the households"',
                  style: TextStyle(
                    fontSize: 10,
                    color: requiredTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ).paddingSymmetric(horizontal: 24),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    cacheExtent: 100.0,
                    shrinkWrap: true,
                    itemCount: controller.tempIndex.value,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 12),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12),
                              child: TextField(
                                controller: controller.nameIEditingController,
                                onEditingComplete: () => node.nextFocus(),
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.isValidNameI.value = false;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: controller.isValidNameI.value
                                      ? 'Required field must not be empty!'
                                      : null,
                                  filled: true,
                                  fillColor: const Color(0xffF5F5F5),
                                  hintText: 'Name*',
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
                                    controller.relationIEditingController,
                                onEditingComplete: () => node.nextFocus(),
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.isValidRelationI.value = false;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: controller.isValidRelationI.value
                                      ? 'Required field must not be empty!'
                                      : null,
                                  filled: true,
                                  fillColor: const Color(0xffF5F5F5),
                                  hintText: 'RelationShip*',
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
                                controller: controller.ageIEditingController,
                                onEditingComplete: () => node.nextFocus(),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.isValidAgeI.value = false;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: controller.isValidAgeI.value
                                      ? 'Required field must not be empty!'
                                      : null,
                                  filled: true,
                                  fillColor: const Color(0xffF5F5F5),
                                  hintText: 'Age*',
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
                                              'Status*',
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
                                              controller.selectedStatus.type!,
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
                                  items: controller.statusList
                                      .map((Status? status) {
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
                                    controller.isValidStatusI.value = false;
                                    controller.selectedStatus = newValue!;
                                    controller.dropDownStatusValue.value =
                                        newValue.type.toString();
                                    node.unfocus();
                                  },
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => controller.isValidStatusI.value &&
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
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12),
                              child: TextField(
                                controller:
                                    controller.educAttainIEditingController,
                                onEditingComplete: () => node.nextFocus(),
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  controller.isValidEducI.value = false;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: controller.isValidEducI.value
                                      ? 'Required field must not be empty!'
                                      : null,
                                  filled: true,
                                  fillColor: const Color(0xffF5F5F5),
                                  hintText: 'Educational Attainment*',
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
                                    controller.occupationIEditingController,
                                onEditingComplete: () => node.unfocus(),
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                onChanged: (value) {
                                  controller.isValidOccupationI.value = false;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: controller.isValidOccupationI.value
                                      ? 'Required field must not be empty!'
                                      : null,
                                  filled: true,
                                  fillColor: const Color(0xffF5F5F5),
                                  hintText: 'Occupation/Monthly*',
                                  hintStyle: TextStyle(
                                    color: textFieldTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: lightBackgroundColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.tempIndex.value++;
                    },
                    child: Text(
                      'Add Data',
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
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
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              controller.onNext2Pressed();
              // Get.toNamed(createupdateinfo3);
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
