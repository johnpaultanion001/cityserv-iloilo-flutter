// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
// import 'package:iloilocityapp/app/global/widgets/custom_listitem.dart';
import 'package:iloilocityapp/app/modules/utilities/my_utilities_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class MyUtilitiesView extends GetView<MyUtilitiesController> {
  const MyUtilitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(getIt<MyUtilitiesController>());
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: false,
            headerText: 'My Utilities',
            mainText: 'View Utilities/Commerce Options',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size24, vertical: size12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Utilities/Commerce Links',
                style: kHeader3TextStyle.copyWith(color: primaryColor),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                controller: controller.scrollController,
                cacheExtent: 20.0,
                shrinkWrap: true,
                itemCount: controller.utilititesList.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    isAsset: true,
                    onPress: () => controller.navigateToDetails(index),
                    title: controller.utilititesList[index].title.toString(),
                    description: controller.utilititesList[index].status.toString(),
                    status: '',
                    imageUrl: controller.utilititesList[index].image.toString(),
                  ).paddingOnly(right: 24, left: 24, bottom: 8);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onUtilititesTapped(context, Utilitites utilitites) {
    switch (utilitites.id) {
      case '1':
        Navigator.pushNamed(context, electricsplashscreen);
        break;
      case '2':
        Navigator.pushNamed(context, electricsplashscreen);
        break;
      case '3':
        Navigator.pushNamed(context, electricsplashscreen);
        break;
    }
  }
}
