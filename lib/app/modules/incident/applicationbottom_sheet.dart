// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/incident/incidentreport_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
// import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationBottomSheet {
  static final controller = Get.put(IncidentReportController());
  static void applicationBottomSheetMenu(BuildContext context) {
    // final controller = Get.put(IncidentReportController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      // isDismissible: false,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 335),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.isUpdate.value == false
                        ? 'Application Completed!'
                        : 'Success!',
                    style: TextStyle(
                      fontSize: 22,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 125,
                    width: 125,
                    child: Image.asset(
                      AssetsPath.survey,
                      height: 125,
                      width: 125,
                      fit: BoxFit.cover,
                      // color: const Color(0xff00A652),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (controller.isUpdate.value == false) {
                          Get.back();
                          Get.toNamed(incidentreportapp);
                          print('false');
                        } else {
                          controller.isUpdate.value = false;
                          Get.back();
                          Get.back();
                          print('true');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'VIEW FORM',
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
                )
              ],
            ).paddingSymmetric(vertical: 32),
          ),
        );
      },
    );
  }

  static void uploadPhotoBottomSheetMenu(BuildContext? context, image) {
    final controller = Get.put(IncidentReportController());

    showModalBottomSheet(
      context: context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Container(
          height: 270,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  height: 4,
                  width: 30,
                  color: Colors.grey.shade200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                child: Text(
                  'Choose option',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22, //theme.textTheme.headline5!.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      controller.getFileImage();
                      Get.back();
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.sd_card,
                          size: 50,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.getCameraImage();
                      Get.back();
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera,
                          size: 50,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      controller.getFileImage();
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.getCameraImage();
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
