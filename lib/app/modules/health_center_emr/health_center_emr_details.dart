// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/health_center_emr.dart';

class HealthCenterEMRDetails extends StatefulWidget {
  const HealthCenterEMRDetails({Key? key}) : super(key: key);

  @override
  _HealthCenterEMRDetailsState createState() => _HealthCenterEMRDetailsState();
}

class _HealthCenterEMRDetailsState extends State<HealthCenterEMRDetails> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments['data'] as EstablishmentModel;

    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Discover Iloilo',
      subTitle: 'View Location Details',
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppImage(
            imageUrl: data.full_path,
            width: size.width,
            height: size150,
          ),
          const SizedBox(
            height: size30,
          ),
          Text(
            data.name,
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text('Hospitals/Health Centers', style: kHeader3TextStyle),
          const SizedBox(
            height: size30,
          ),
          Text(
            'Location Details',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text('Location Address/Contact Details', style: kHeader3TextStyle),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              Container(
                width: size45,
                height: size45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: customButtonBackground,
                ),
                child: Image.asset(
                  AssetsPath.map,
                  height: size26,
                  width: size26,
                ),
              ),
              SizedBox(
                width: size16,
              ),
              Text(
                data.address,
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              Container(
                width: size45,
                height: size45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: customButtonBackground,
                ),
                child: Image.asset(
                  AssetsPath.email,
                  height: size26,
                  width: size26,
                ),
              ),
              SizedBox(
                width: size16,
              ),
              Text(
                'info@imh.ph',
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              Container(
                width: size45,
                height: size45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: customButtonBackground,
                ),
                child: Image.asset(
                  AssetsPath.contact,
                  height: size26,
                  width: size26,
                ),
              ),
              SizedBox(
                width: size16,
              ),
              Text(
                '(033) 320 0315 to 19',
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
