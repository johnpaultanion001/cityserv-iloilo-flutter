// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
// import 'package:iloilocityapp/app/modules/parent/applicationbottom_sheet.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateInfoView3 extends GetView<SoloParentController> {
  const CreateUpdateInfoView3({Key? key}) : super(key: key);

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'II. Classification / Circumtances of being a Solo Parent:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextField(
                            controller: controller.detailsIIEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDetailsII.value = false;
                            },
                            maxLines: 6,
                            minLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidDetailsII.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Enter Here*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'III. Needs / Problems of Solo Parents:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextField(
                            controller: controller.detailsIIIEditingController,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              controller.isValidDetailsIII.value = false;
                            },
                            maxLines: 6,
                            minLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidDetailsIII.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Enter Here*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IV. Family Resources:',
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 24, vertical: 12),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: TextField(
                            controller: controller.detailsIIVEditingController,
                            onEditingComplete: () => node.unfocus(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            onChanged: (value) {
                              controller.isValidDetailsIV.value = false;
                            },
                            maxLines: 6,
                            minLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide.none,
                              ),
                              errorText: controller.isValidDetailsIV.value
                                  ? 'Required field must not be empty!'
                                  : null,
                              filled: true,
                              fillColor: const Color(0xffF5F5F5),
                              hintText: 'Enter Here*',
                              hintStyle: TextStyle(
                                color: textFieldTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => CheckboxListTile(
                          title: Text(
                            'I hereby certify that the information given above is true and correct. I further understand that misinterpretation that may have will subject me to criminal and civil liabilities provided by existing laws.',
                            style: TextStyle(
                              fontSize: 10,
                              color: secondaryTextColor,
                            ),
                          ),
                          value: controller.isCheckCertify.value,
                          onChanged: (newValue) {
                            controller.isCheckCertify.value = newValue!;
                          },

                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ).paddingOnly(right: 24, top: 24),
                      ),
                      Obx(
                        () => controller.isCheckCertify.value == false
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 24.0, top: 8),
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Please Certify if this Information is true!',
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
              ),
            ],
          ).paddingOnly(bottom: 45),
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
              // if (controller.isUpdate.value == false) {
              // ApplicationBottomSheet.applicationBottomSheetMenu(context);
              controller.onCreateRecord(context);
              // } else {
              //   Get.back();
              // }
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
