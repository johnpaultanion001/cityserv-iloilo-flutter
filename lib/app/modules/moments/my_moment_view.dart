// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/models/moment_model.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_grid_item.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/models/my_moments.dart';
import 'package:iloilocityapp/app/modules/moments/moments_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class MyMomentsView extends StatefulWidget {
  const MyMomentsView({Key? key}) : super(key: key);

  @override
  _MyMomentsViewState createState() => _MyMomentsViewState();
}

class _MyMomentsViewState extends State<MyMomentsView> {
  final controller = getIt<MomentsController>();

  @override
  void initState() {
    controller.getMomentsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
      title: 'My Iloilo Moments',
      subTitle: 'Capture your City Moments',
      content: Column(
        children: [
          ListHeader(
            horizontalPadding: 0,
            title: 'My Moments',
            onPressed: () {
              controller.filterMoment();
              // _showFilter();
            },
          ),
          Expanded(
            child: Obx(() => _momentsView()),
          ),
          AppElevatedButton(
              color: primaryColor,
              child: Text(
                'Add New Moment'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: controller.gotToAdMoment)
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
              hintText: 'Filtered by Title',
            ),
            AppDropdownButton(
              onChanged: (value) {},
              items: const ['Type'],
              hintText: 'Filtered by Date Type',
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

  Widget _momentsView() {
    return controller.isLoadingMoments.value
        ? AppLoadingIndicator()
        : RefreshIndicator(
            onRefresh: () async => await controller.getMomentsList(),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: controller.momentsList.length,
                itemBuilder: (context, index) {
                  final data = controller.momentsList[index] as MomentModel;
                  return ListGridItem(
                    onPress: () {
                      controller.navigateToDetails(data);
                    },
                    title: data.info.sender,
                    description: data.info.content,
                    status: data.info.status,
                    imageUrl: data.info.thumbPath,
                  );
                }),
          );
  }
}
