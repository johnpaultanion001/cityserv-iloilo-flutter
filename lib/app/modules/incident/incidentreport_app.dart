// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/incident/incidentreport_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentReportApp extends GetView<IncidentReportController> {
  const IncidentReportApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(IncidentReportController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: statusBarColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
                              'INCIDENT REPORT',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'View Report',
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
              ).paddingOnly(top: 24, right: 24, left: 8),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: FileImage(controller.image!),
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
              ).paddingSymmetric(horizontal: 24, vertical: 16),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Report Name Here',
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24, vertical: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Report Status:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 32,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffFFBB00),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Pending',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Report Information',
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 8),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            'Case Number:         ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.caseNumberEditingController.text,
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                      Row(
                        children: [
                          Text(
                            'Nature Case/s Field:',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.selectedCase.type.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Report Details:',
                            style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 8),
                      Text(
                        controller.caseDescEditingController.text,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ).paddingSymmetric(vertical: 4),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            'Complaint Date:           ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.complainDateEditingController.text,
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                      Row(
                        children: [
                          Text(
                            'Filed Date:                   ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.filedDateEditingController.text,
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                      Row(
                        children: [
                          Text(
                            'Complaint Name:                ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.complainNameEditingController.text,
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                      Row(
                        children: [
                          Text(
                            'Phone Number:                ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            controller.phoneNumberEditingController.text
                                .toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                        ],
                      ).paddingSymmetric(vertical: 4),
                    ],
                  ).paddingSymmetric(horizontal: 24),
                ),
              ),
            ],
          ).paddingOnly(bottom: 65),
        ),
      ),
      bottomSheet: Padding(
        // color: statusBarColor,
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              Get.back();
              Get.back();
              controller.isUpdate.value = true;

              Get.toNamed(createupdateincident);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'EDIT REPORT',
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
