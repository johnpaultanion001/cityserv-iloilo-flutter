// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_model.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/my_moments.dart';
import 'package:iloilocityapp/app/modules/moments/moments_controller.dart';

class MyMomentsDetailsView extends StatefulWidget {
  const MyMomentsDetailsView({Key? key}) : super(key: key);

  @override
  _MyMomentsDetailsViewState createState() => _MyMomentsDetailsViewState();
}

class _MyMomentsDetailsViewState extends State<MyMomentsDetailsView> {
  final controller = getIt<MomentsController>();

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments['data'] as MomentModel;

    return AppScaffoldWithHeader(
      title: 'View  Moment',
      subTitle: 'View your City Moments',
      content: Column(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: size16,
                left: size16,
                right: size16,
                top: size16,
                child: Image.network(
                  data.info.fullPath,
                  height: size70,
                  width: size90,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: size300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AssetsPath.momentBg),
                  fit: BoxFit.fill,
                )),
              ),
            ],
          ),
          const SizedBox(
            height: size30,
          ),
          Text(
            data.info.sender,
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text(data.info.status, style: kHeader3TextStyle),
          Spacer(),
          AppElevatedButton(
              isLoading: controller.isDownloadingImage.value,
              color: primaryColor,
              child: Text(
                'Download Moment'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () async => await controller.downloadMoment(data.info.fullPath))
        ],
      ),
    );
  }
}
