// import 'package:iloilocityapp/app/global/configs/colors.dart';
// import 'package:iloilocityapp/app/global/constants/assets_path.dart';
// import 'package:iloilocityapp/app/modules/dashboard/dashboard_view.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_colors.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/assets_electric_path.dart';
import 'package:iloilocityapp/app/modules/more_electric/electric_home/electric_home_view.dart';
import 'package:iloilocityapp/app/modules/more_electric/electric_profile/electric_profile_view.dart';
import 'package:iloilocityapp/app/modules/more_electric/electric_projects/electric_projects_view.dart';
import 'package:iloilocityapp/app/modules/more_electric/electric_settings/electric_settings.dart';
// import 'package:iloilocityapp/app/modules/profile/my_profile.dart';
// import 'package:iloilocityapp/app/modules/settings/settings.dart';
// import 'package:iloilocityapp/app/modules/utilities/my_utilities_view.dart';

class BottomNavElectricController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;

  RxInt selectedIndex = 0.obs;
  final pageController = PageController();

  void resetIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  final List<Widget> bodyElectricContext = [
    const ElectricHomeView(),
    const ElectricProfileView(),
    const ElectricProjectsView(),
    const ElectricSettingsView(),
  ];
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  final theme = Theme.of(Get.context!);
  final List<BottomNavigationBarItem> navElectricItem = [
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsElectricPath.navElectricHome),
        size: 35,
      ),
      label: '',
      activeIcon: ImageIcon(
        const AssetImage(AssetsElectricPath.navElectricHome),
        color: primaryElectricColor,
        size: 35,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsElectricPath.navElectricProfile),
        size: 35,
      ),
      label: '',
      activeIcon: ImageIcon(
        const AssetImage(AssetsElectricPath.navElectricProfile),
        color: primaryElectricColor,
        size: 35,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsElectricPath.navElectricProjects),
        size: 35,
      ),
      label: '',
      activeIcon: ImageIcon(
        const AssetImage(AssetsElectricPath.navElectricProjects),
        color: primaryElectricColor,
        size: 35,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsElectricPath.navElectricSettings),
        size: 35,
      ),
      label: '',
      activeIcon: ImageIcon(
        const AssetImage(AssetsElectricPath.navElectricSettings),
        color: primaryElectricColor,
        size: 35,
      ),
    ),
  ];
}
