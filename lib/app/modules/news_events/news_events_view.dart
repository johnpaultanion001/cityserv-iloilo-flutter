// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/models/news_events.dart';
import 'package:iloilocityapp/app/modules/news_events/news_events_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class NewsEventsView extends StatefulWidget {
  const NewsEventsView({Key? key}) : super(key: key);

  @override
  _NewsEventsViewState createState() => _NewsEventsViewState();
}

class _NewsEventsViewState extends State<NewsEventsView> {
  final controller = getIt<NewsAndEventsController>();

  @override
  void initState() {
    controller.getArticleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
      title: 'News & Events',
      subTitle: 'View News & Announcements',
      content: Column(
        children: [
          ListHeader(
            horizontalPadding: 0,
            title: 'News & Announcements',
            onPressed: () {
              controller.filterArticles();
              // _showFilter();
            },
          ),
          Obx(() => _newsAndEventsView()),
        ],
      ),
    );
  }

  _showFilter() {
    showFilterBottomSheet(context,
        title: 'Filter Results',
        content: Expanded(
          child: Column(children: [
            AppDropdownButton(
              onChanged: (value) {},
              items: const ['Title'],
              hintText: 'Filtered by News Name',
            ),
            AppDropdownButton(
              onChanged: (value) {},
              items: const ['Type'],
              hintText: 'Filtered by Events Type',
            ),
            const SizedBox(
              height: size10,
            ),
            AppElevatedButton(
              child: Text(
                'APPLY FILTER',
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () {},
            ),
          ]),
        ));
  }

  Widget _newsAndEventsView() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
            itemCount: controller.articleList.length,
            itemBuilder: (context, index) {
              final data = controller.articleList[index] as ArticleModel;
              return ListItem(
                  onPress: () => controller.navigateToDetails(data),
                  title: data.title,
                  description: 'Published: ${data.date.dateDb}',
                  imageUrl: '${data.info.thumbPath}');
            }),
      ),
    );
  }
}
