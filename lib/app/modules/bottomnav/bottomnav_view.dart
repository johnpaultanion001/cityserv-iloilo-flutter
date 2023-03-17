// ignore_for_file: sort_child_properties_last

import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/modules/bottomnav/bottomnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: controller.bodyContext,
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        // ),
      ),
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomNavigationBar(
              items: controller.navItem,
              iconSize: 22,
              elevation: 3.0,
              selectedFontSize: 16,
              unselectedFontSize: 16,
              backgroundColor: Colors.white,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => controller.pageController
                  .jumpToPage(index), //controller.selectedIndex.value = index,
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
