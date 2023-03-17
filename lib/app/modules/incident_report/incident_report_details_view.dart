// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/date_helpers.dart';
import 'package:iloilocityapp/app/global/utils/date_patterns.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';

class IncidentReportDetailsView extends StatefulWidget {
  IncidentReportDetailsView({Key? key}) : super(key: key);

  @override
  State<IncidentReportDetailsView> createState() => _IncidentReportDetailsViewState();
}

class _IncidentReportDetailsViewState extends State<IncidentReportDetailsView> {
  @override
  Widget build(BuildContext context) {
    var report = Get.arguments['data'] as CitizenReport;
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Incident Report',
      subTitle: 'View Incident Report Details',
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppImage(
            imageUrl: report.imageUrl,
            width: size.width,
            height: size150,
          ),
          const SizedBox(
            height: size30,
          ),
          Text(
            report.title,
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              const Text('Report Status:', style: kHeader3TextStyle),
              const SizedBox(
                width: size10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: size10, vertical: size5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
                    color: getStatusColor(report.status)),
                child: Center(
                    child: Text(
                  report.status,
                  style: kTitleTextStyle.copyWith(color: kWhite),
                )),
              )
            ],
          ),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Report Description',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text(
            report.description,
            style: kTitleTextStyle,
          ),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Report Details',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              SizedBox(
                width: appSize(context).width / size3,
                child: Text(
                  'Report Type: ',
                  style: kTitleTextStyle.copyWith(color: primaryColor),
                ),
              ),
              Text(
                report.reportType,
                style: kTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: size10,
          ),
          Row(
            children: [
              SizedBox(
                width: appSize(context).width / size3,
                child: Text(
                  'Report Date: ',
                  style: kTitleTextStyle.copyWith(color: primaryColor),
                ),
              ),
              Text(
                report.reportDate.toStringDate(),
                style: kTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: size10,
          ),
          Row(
            children: [
              SizedBox(
                width: appSize(context).width / size3,
                child: Text(
                  'Date Resolved: ',
                  style: kTitleTextStyle.copyWith(color: primaryColor),
                ),
              ),
              Text(
                report.resolvedDate.toStringDate(),
                style: kTitleTextStyle,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
