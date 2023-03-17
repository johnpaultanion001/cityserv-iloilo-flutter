import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/custom_filter.dart';
import 'package:iloilocityapp/app/global/widgets/custom_listitem.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_controller.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class IncidentReportView extends StatefulWidget {
  const IncidentReportView({Key? key}) : super(key: key);

  @override
  State<IncidentReportView> createState() => _IncidentReportViewState();
}

class _IncidentReportViewState extends State<IncidentReportView> {
  final _controller = getIt<DashboardController>();

  @override
  void initState() {
    _controller.getMyReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _incidentReportView();
    });
  }

  Widget _incidentReportView() {
    return _controller.isLoadingReports.value
        ? const AppLoadingIndicator()
        : Column(
            children: [
              CustomFilter(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    citizenReport,
                  );
                },
                buttonText: 'View All',
                textString: 'Current Incident Report',
              ).paddingSymmetric(horizontal: 24),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    color: dividerColor,
                  ),
                ),
                cacheExtent: 20.0,
                shrinkWrap: true,
                itemCount: _controller.incidentReportList.length,
                itemBuilder: (context, index) {
                  final data = _controller.incidentReportList[index] as CitizenReportModel;
                  return ListItem(
                    onPress: () {
                      Navigator.pushNamed(context, citizenReportDetails, arguments: {'data': data});
                    },
                    title: data.title ?? '',
                    description: 'Reported: ${data.date.timePassed}',
                    status: data.info.status,
                    imageUrl: data.info.thumbPath,
                  );
                },
              )
            ],
          );
  }
}
