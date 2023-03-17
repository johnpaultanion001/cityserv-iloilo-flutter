import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/models/ease_of_business_response.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/utils/html_helper.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';

class EaseOfBusinessDetailsView extends StatefulWidget {
  EaseOfBusinessDetailsView({Key? key}) : super(key: key);

  @override
  State<EaseOfBusinessDetailsView> createState() => _EaseOfBusinessDetailsViewState();
}

class _EaseOfBusinessDetailsViewState extends State<EaseOfBusinessDetailsView> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments['data'] as EaseOfBusinessModel;
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Ease of Business',
      subTitle: 'View Business Service Details',
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppImage(
            imageUrl: data.info.fullPath,
            width: size.width,
            height: size150,
          ),
          const SizedBox(
            height: size30,
          ),
          HtmlWidget(HtmlHelper.removeTag(htmlString: data.info.content))
        ]),
      ),
    );
  }
}
