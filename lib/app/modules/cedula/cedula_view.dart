// ignore_for_file: prefer_const_constructors

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/cedula/cedula_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CedulaView extends GetView<CedulaController> {
  const CedulaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CedulaController());
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
          // child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
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
                              'COMMUNITY TAX',
                              style: TextStyle(
                                fontSize: 24,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'CERTIFICATE:',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(Auditors Copy)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'View Pending Forms/Add New Request Here',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Records',
                    style: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: lightBackgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  // child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  cacheExtent: 100.0,
                  shrinkWrap: true,
                  itemCount: controller.reportList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 72,
                      width: double.infinity,

                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: statusBarColor,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    controller.reportList[index].image
                                        .toString(),
                                    height: 24,
                                    width: 30,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    controller.reportList[index].title
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ).paddingOnly(bottom: 4),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Status:',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '  ${controller.reportList[index].status.toString()}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: controller.reportList[index]
                                                        .status ==
                                                    'Pending'
                                                ? textStatusColor
                                                : successButtonColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: controller.reportList[index].status ==
                                      'Pending'
                                  ? lightBackgroundColor
                                  : successButtonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:
                                controller.reportList[index].status == 'Pending'
                                    ? Image.asset(
                                        AssetsPath.arrowBlue,
                                      )
                                    : Icon(
                                        Icons.download_sharp,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 24, right: 24, bottom: 8, left: 24);
                  },
                ),
              ),
            ],
          ).paddingOnly(bottom: 65),
          // ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              Get.toNamed(createupdatecedula);
              // controller.isUpdate.value = false;
              controller.clearFields();
              controller.onInit();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'ADD APPLICATIONS',
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
