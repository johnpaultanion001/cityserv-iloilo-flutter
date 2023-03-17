// ignore_for_file: library_private_types_in_public_api, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/directory_response.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
// import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item_vertical.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
import 'package:iloilocityapp/app/models/discover_categories.dart';
import 'package:iloilocityapp/app/models/discover_iloilo.dart';
import 'package:iloilocityapp/app/modules/discover/discover_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final searchTextController = TextEditingController();
  final controller = getIt<DiscoverController>();

  @override
  void initState() {
    controller.getDirectories();
    controller.getEstablishments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    final discover = DiscoverIloilo.sample();

    final node = FocusScope.of(context);

    return AppScaffoldWithHeader(
      title: 'Discover Iloilo',
      subTitle: 'View Locations & Establishments',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            textEditingController: searchTextController,
            isObscureText: false,
            hintText: 'Search Locations',
            textAlign: TextAlign.left,
            onChange: (value) => controller.searchItems(value),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                const AssetImage(AssetsPath.search),
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: size24,
          ),
          Obx(() => _discoverView()),
          const SizedBox(
            height: size24,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'LGU/Government Establishments',
              style: kHeader3TextStyle.copyWith(color: primaryColor),
            ),
          ),
          Obx(() => _establishmentsView()),
        ],
      ),
    );
  }

  Widget _discoverView() {
    return SizedBox(
      height: size50,
      child: controller.isLoadingDirectories.value
          ? AppLoadingIndicator()
          : ListView.builder(
              itemCount: controller.directoryList.length,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = controller.directoryList[index] as DirectoryModel;
                return ListItemVertical(
                  onPress: () => controller.filterEstablishments(data.title),
                  title: data.title,
                );
              }),
    );
  }

  Widget _establishmentsView() {
    return controller.isLoadingEstablishments.value
        ? AppLoadingIndicator()
        : Expanded(
            child: RefreshIndicator(
              onRefresh: () async => await controller.getEstablishments(),
              child: ListView.builder(
                  itemCount: controller.establishmentList.length,
                  itemBuilder: (context, index) {
                    final data = controller.establishmentList[index] as EstablishmentModel;
                    return ListItem(
                      onPress: () {
                        Navigator.pushNamed(context, discoverDetails, arguments: {'data': data});
                      },
                      title: data.name,
                      description: data.address,
                      status: '',
                      imageUrl: data.thumb_path,
                    );
                  }),
            ),
          );
  }
}
