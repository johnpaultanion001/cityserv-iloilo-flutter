import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/clearance/clearance_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearanceApp extends GetView<ClearanceController> {
  const ClearanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClearanceController());
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
            crossAxisAlignment: CrossAxisAlignment.end,
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
                            const Text(
                              'My Application',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
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
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: lightBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    controller.isUpdate.value = true;
                    // controller.isUpdated();
                    Get.toNamed(createupdateclearance);
                  },
                  child: Text(
                    'Edit Application',
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Registered name of Business Establishment:',
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Business Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.businessNameEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Status:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedStatus.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Business Address:',
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ).paddingOnly(bottom: 6, top: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Unit Floor No.:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.unitFloorEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Building Name:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.buildingNameEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Street Address:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedStreetAddress.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Street Corner:  ',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedStreeCorner.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subdivision:    ',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedSubdivision.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tax Payer TIN:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.tinEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'SEC/DTI',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Reg. No.:        ',
                                style: TextStyle(fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                controller.dtiRegEditingController.text,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Applicant/',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Representative Name:',
                                style: TextStyle(fontSize: 15),
                              ),
                              const Spacer(),
                              Text(
                                controller.applicantNameEditingController.text,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 15),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Telephone Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.telNumberEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Fax Number:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.faxNumberEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Area of Est.:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.areaEditingController.text,
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Business Ownership:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedOwnership.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Nature of Business:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedBusinessNature.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Owned:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedOwned.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Payment:',
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                          Text(
                            controller.selectedPayment.type.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ).paddingOnly(bottom: 6, top: 6),
                      Divider(
                        height: 2,
                        color: mainDividerColor,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        color: Colors.white,
      ),
    );
  }
}
