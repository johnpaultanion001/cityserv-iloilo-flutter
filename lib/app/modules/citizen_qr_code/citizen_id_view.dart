import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/date_patterns.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_text_fields.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';

class CitizenIDView extends StatefulWidget {
  CitizenIDView({Key? key}) : super(key: key);

  @override
  State<CitizenIDView> createState() => _CitizenIDViewState();
}

class _CitizenIDViewState extends State<CitizenIDView> {
  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Citizen ID',
      subTitle: 'View My Citizen ID',
      content:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            AppImage(
              width: size.width,
              height: 191,
              imageUrl: AssetsPath.citizenIdFront,
              isAsset: true,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: size30,
            ),
            AppImage(
              width: size.width,
              height: 191,
              imageUrl: AssetsPath.citizenIdBack,
              isAsset: true,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
        AppElevatedButton(
          child: Text(
            'Download Citizen ID'.toUpperCase(),
            style: kHeader3TextStyle.copyWith(color: kWhite),
          ),
          onPressed: () {},
        )
      ]),
    );
  }
}
