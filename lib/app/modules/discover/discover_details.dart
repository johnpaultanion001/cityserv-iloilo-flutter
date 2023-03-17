// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
// import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';

class DiscoverDetailsView extends StatefulWidget {
  const DiscoverDetailsView({Key? key}) : super(key: key);

  @override
  _DiscoverDetailsViewState createState() => _DiscoverDetailsViewState();
}

class _DiscoverDetailsViewState extends State<DiscoverDetailsView> {
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
          Text('LGU/Govennment Establishment', style: kHeader3TextStyle),
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
                data.email,
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
                data.contact,
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
