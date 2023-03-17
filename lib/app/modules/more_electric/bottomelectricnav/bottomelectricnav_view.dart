// ignore_for_file: sort_child_properties_last

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/modules/more_electric/bottomelectricnav/bottomelectricnav_controller.dart';

class BottomNavElectricView extends GetView<BottomNavElectricController> {
  const BottomNavElectricView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavElectricController());
    return Scaffold(
      body:
          // WillPopScope(
          //   onWillPop: () => Dialogs.onBackPressedExit(context),
          //   child:
          PageView(
        children: controller.bodyElectricContext,
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        // ),
      ),
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomNavigationBar(
              items: controller.navElectricItem,
              iconSize: 22,
              elevation: 3.0,
              selectedFontSize: 16,
              unselectedFontSize: 16,
              backgroundColor: Colors.white,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => controller.pageController.jumpToPage(index), //controller.selectedIndex.value = index,
              selectedItemColor: primaryColor,
              unselectedItemColor: navUnselectedColor,
              showUnselectedLabels: true,
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                color: navUnselectedColor,
              ),
              selectedLabelStyle: TextStyle(
                fontSize: 12,
                color: primaryColor,
              ),
              type: BottomNavigationBarType.fixed,
            ),
          ],
        ),
      ),
    );
  }
}
