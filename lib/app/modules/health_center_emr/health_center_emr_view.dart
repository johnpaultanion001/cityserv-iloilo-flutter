// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
import 'package:iloilocityapp/app/models/health_center_emr.dart';
import 'package:iloilocityapp/app/modules/health_center_emr/health_emr_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class HealthCenterEMRView extends StatefulWidget {
  const HealthCenterEMRView({Key? key}) : super(key: key);

  @override
  _HealthCenterEMRViewState createState() => _HealthCenterEMRViewState();
}

class _HealthCenterEMRViewState extends State<HealthCenterEMRView> {
  final firstNameTextController = TextEditingController();
  final controller = getIt<HealthEMRController>();

  @override
  void initState() {
    controller.getEstablishments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final healthcenter = HealthCenterEmr.sample();

    final node = FocusScope.of(context);
    return AppScaffoldWithHeader(
      title: 'Health Center EMR',
      subTitle: 'View Medical Establishments',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            textEditingController: firstNameTextController,
            isObscureText: false,
            hintText: 'Search Hospitals',
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hospitals/Health Centers',
              style: kHeader3TextStyle.copyWith(color: primaryColor),
            ),
          ),
          Obx(() => _establishmentsView()),
        ],
      ),
    );
  }

  Widget _establishmentsView() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
            itemCount: controller.establishmentList.length,
            itemBuilder: (context, index) {
              final data = controller.establishmentList[index] as EstablishmentModel;
              return ListItem(
                onPress: () => controller.navigateToDetails(data),
                title: data.name,
                description: data.address,
                imageUrl: data.thumb_path,
              );
            }),
      ),
    );
  }
}
