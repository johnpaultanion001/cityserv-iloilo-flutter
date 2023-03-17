// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
import 'package:iloilocityapp/app/modules/profile/profile_controller.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final controller = getIt<ProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: false,
            headerText: 'My Profile',
            mainText: 'View/Update Profile Information',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Obx(() => _profileView())
        ],
      ),
    );
  }

  Widget _profileView() {
    if (controller.loadingProfile.value) {
      return const AppLoadingIndicator();
    }

    final data = controller.profileData['data'] as ProfileModel;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: size24,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
            ),
            const SizedBox(
              height: size24,
            ),
            Text(
              data.completeName,
              style: kHeader2TextStyle,
            ),
            const SizedBox(
              height: size24,
            ),
            Text('${data.email}', style: kHeader3TextStyle),
            const SizedBox(
              height: size12,
            ),
            Text(data.contactNumber, style: kHeader3TextStyle),
            const SizedBox(
              height: size24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Information',
                  style: kHeader2TextStyle.copyWith(color: primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Civil Status:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${data.civilStatus}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Gender:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Male',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Birthdate:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${data.birthday}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Address',
                  style: kHeader2TextStyle.copyWith(color: primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Province:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${data.province}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'City:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${data.city}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Street Name:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '#1 Street Name',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Barangay:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${data.barangay}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: size24, vertical: size4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Zip Code:',
                      style: kTitleTextStyle.copyWith(color: primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '',
                      style: kTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
