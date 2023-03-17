import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/models/ease_of_business_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/custom_button.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';
import 'package:iloilocityapp/app/modules/ease_of_business/ease_of_business_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class EaseOfBusinessView extends StatefulWidget {
  const EaseOfBusinessView({Key? key}) : super(key: key);

  @override
  State<EaseOfBusinessView> createState() => _EaseOfBusinessViewState();
}

class _EaseOfBusinessViewState extends State<EaseOfBusinessView> {
  final _controller = getIt<EaseOfBusinessController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getAllBusiness();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
      title: 'Ease of Business',
      subTitle: 'View Business Services Here',
      content: Column(
        children: [
          const ListHeader(
            horizontalPadding: 0,
            title: 'Business Registration/Management',
            showFilter: false,
          ),
          Obx(() => _easeOfBusinessView()),
        ],
      ),
    );
  }

  _easeOfBusinessView() {
    if (_controller.loadingBusiness.value) {
      return const AppLoadingIndicator();
    }

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async => await _controller.getAllBusiness(),
        child: ListView.builder(
            itemCount: _controller.businessList.length,
            itemBuilder: (context, index) {
              final data = _controller.businessList[index] as EaseOfBusinessModel;
              return ListItem(
                onPress: () {
                  Navigator.pushNamed(context, easeOfBusinessDetails, arguments: {'data': data});
                },
                title: data.title,
                description: '${data.excerpt}',
                status: '',
                imageUrl: data.info.thumbPath,
              );
            }),
      ),
    );
  }
}
