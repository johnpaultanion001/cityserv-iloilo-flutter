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

class IncidentReportCreateView extends StatefulWidget {
  IncidentReportCreateView({Key? key}) : super(key: key);

  @override
  State<IncidentReportCreateView> createState() => _IncidentReportCreateViewState();
}

class _IncidentReportCreateViewState extends State<IncidentReportCreateView> {
  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Citizen Report',
      subTitle: 'Manage/Create Incident Report',
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Enter the information in the required fields',
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                '*',
                style: kTitleTextStyle.copyWith(color: cancelledColor),
              ),
            ],
          ),
          const SizedBox(
            height: size15,
          ),
          DottedBorder(
              dashPattern: [8, 4],
              strokeWidth: 2,
              radius: const Radius.circular(defaultBorderRadius),
              color: kGrey,
              child: SizedBox(
                height: size150,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Report Photo',
                        style: kHeader3TextStyle.copyWith(color: kGrey),
                      ),
                      const SizedBox(
                        width: size10,
                      ),
                      const Icon(
                        Icons.photo_camera,
                        color: kGrey,
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Report Information',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size10,
          ),
          AppDropdownButton(
            onChanged: (value) {},
            items: ['Type'],
            hintText: 'Report Type',
            isRequired: true,
          ),
          const AppTextField(
            hintText: 'Report Subject',
          ),
          const AppTextField(
            hintText: 'Report Description',
            maxLines: 5,
          ),
          AppElevatedButton(
              verticalMargin: size20,
              child: Text(
                'Submit Report'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () {})
        ]),
      ),
    );
  }
}
