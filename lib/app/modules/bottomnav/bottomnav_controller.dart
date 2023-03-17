import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/modules/profile/my_profile.dart';
import 'package:iloilocityapp/app/modules/settings/settings.dart';
import 'package:iloilocityapp/app/modules/utilities/my_utilities_view.dart';

class BottomNavController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;

  RxInt selectedIndex = 0.obs;
  final pageController = PageController();

  void resetIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  final List<Widget> bodyContext = [
    const DashboardView(),
    const MyProfileView(),
    const MyUtilitiesView(),
    const SettingsView(),
  ];
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  final theme = Theme.of(Get.context!);
  final List<BottomNavigationBarItem> navItem = [
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsPath.navHome),
        size: 30,
      ),
      label: 'Home',
      activeIcon: ImageIcon(
        const AssetImage(AssetsPath.navHome),
        color: primaryColor,
        size: 30,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsPath.navProfile),
        size: 30,
      ),
      label: 'My Profile',
      activeIcon: ImageIcon(
        const AssetImage(AssetsPath.navProfile),
        color: primaryColor,
        size: 30,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsPath.navProjects),
        size: 30,
      ),
      label: 'My Utilities',
      activeIcon: ImageIcon(
        const AssetImage(AssetsPath.navProjects),
        color: primaryColor,
        size: 30,
      ),
    ),
    BottomNavigationBarItem(
      icon: const ImageIcon(
        AssetImage(AssetsPath.navSettings),
        size: 30,
      ),
      label: 'Settings',
      activeIcon: ImageIcon(
        const AssetImage(AssetsPath.navSettings),
        color: primaryColor,
        size: 30,
      ),
    ),
  ];
}
