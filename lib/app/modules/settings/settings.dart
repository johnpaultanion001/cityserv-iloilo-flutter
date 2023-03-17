// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
import 'package:iloilocityapp/app/modules/login/login_view.dart';
import 'package:iloilocityapp/app/modules/settings/settings_controller.dart';
import 'package:iloilocityapp/app/modules/settings/widget/list_tile_widget.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final controller = getIt<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: false,
            headerText: 'Settings',
            mainText: 'Manage Your Account',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size24, vertical: size16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: kHeader3TextStyle.copyWith(color: primaryColor),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTileWidget(
                    image: AssetsPath.editProfile,
                    title: 'Edit Profile',
                    onPressed: () => controller.navigateToPage(editprofile),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  ListTileWidget(
                    image: AssetsPath.password,
                    title: 'Change Password',
                    onPressed: () => controller.navigateToPage(updatepassword),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  ListTileWidget(
                    image: AssetsPath.delete,
                    title: 'Delete Account',
                    titleColor: kRed,
                    onPressed: () => controller.navigateToPage(''),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size24, vertical: size16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Privacy Settings',
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTileWidget(
                    image: AssetsPath.privacy,
                    title: 'Privacy Policy',
                    onPressed: () => controller.navigateToPage(privacypolicy),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  ListTileWidget(
                    image: AssetsPath.privacy,
                    title: 'Terms of Use',
                    onPressed: () => controller.navigateToPage(termsconditon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Divider(
                      color: dividerColor,
                    ),
                  ),
                  ListTileWidget(
                    image: AssetsPath.signout,
                    titleColor: kRed,
                    title: 'Sign Out',
                    onPressed: () async => await controller.signOutClick(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
