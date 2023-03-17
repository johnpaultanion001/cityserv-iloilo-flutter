import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';

class JobOpeningDetailsView extends StatefulWidget {
  const JobOpeningDetailsView({Key? key}) : super(key: key);

  @override
  State<JobOpeningDetailsView> createState() => _JobOpeningDetailsViewState();
}

class _JobOpeningDetailsViewState extends State<JobOpeningDetailsView> {
  @override
  Widget build(BuildContext context) {
    var job = Get.arguments['data'] as JobModel;
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Job Opening Details',
      subTitle: 'View Job Details',
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppImage(
            imageUrl: job.info.fullPath,
            width: size.width,
            height: size150,
          ),
          const SizedBox(
            height: size30,
          ),
          Text(
            job.title,
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text('By: ${job.employer}', style: kHeader3TextStyle),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Job Opening Details',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text(
            job.excerpt,
            style: kTitleTextStyle,
          ),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'How to Apply?',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          const Text(
            'Send your application to/or contact:',
            style: kTitleTextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Row(
            children: [
              Container(
                height: size45,
                width: size45,
                decoration: BoxDecoration(
                  color: customButtonBackground,
                  borderRadius: BorderRadius.circular(size4),
                ),
                child: Center(child: SvgPicture.asset(AssetsPath.detailsSvg)),
              ),
              const SizedBox(
                width: size10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${job.email}',
                    style: kTitleTextStyle.copyWith(color: primaryColor),
                  ),
                  Text(
                    '${job.contactNumber}',
                    style: kTitleTextStyle.copyWith(color: primaryColor),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
