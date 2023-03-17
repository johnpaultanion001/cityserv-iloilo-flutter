// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          CustomHeader(
            isBackVisible: true,
            headerText: 'Privcay Policy',
            mainText: 'View App Privacy Policy',
            isLogoVisible: false,
            isDashBorad: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size32,
                  ),
                  Image.asset(
                    AssetsPath.iloiloSeal,
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: size8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24, vertical: size24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'App Privacy Policy',
                        style: kHeader2TextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: kTitleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: size32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: size24),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: kTitleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: size32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
