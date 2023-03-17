// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_response.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/utils/date_helpers.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/news_events.dart';

class NewsEventsDetails extends StatefulWidget {
  const NewsEventsDetails({Key? key}) : super(key: key);

  @override
  _NewsEventsDetailsState createState() => _NewsEventsDetailsState();
}

class _NewsEventsDetailsState extends State<NewsEventsDetails> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments['data'] as ArticleModel;

    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'View News & Events',
      subTitle: 'View News & Announcements',
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
          Text(
            data.title,
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          Text(
            'Published on: ${data.date.timestamp.toStringDate()}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: size30,
          ),
          Text(
            'News Description',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size15,
          ),
          HtmlWidget(data.info.content),
        ]),
      ),
    );
  }
}
