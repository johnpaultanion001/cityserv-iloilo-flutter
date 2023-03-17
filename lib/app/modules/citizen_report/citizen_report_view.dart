import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_loading_indicator.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class CitizenReportView extends StatefulWidget {
  const CitizenReportView({Key? key}) : super(key: key);

  @override
  State<CitizenReportView> createState() => _CitizenReportViewState();
}

class _CitizenReportViewState extends State<CitizenReportView> {
  final _controller = getIt<CitizenReportController>();

  @override
  void initState() {
    _controller.clearReportViewState();
    _controller.getReportTypes();
    _controller.getMyReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
      title: 'Citizen Report',
      subTitle: 'Manage/Create Incident Report',
      content: Column(
        children: [
          ListHeader(
            horizontalPadding: 0,
            title: 'My Reports',
            onPressed: () => _showFilter(),
          ),
          Obx(() => _myReportsView()),
          AppElevatedButton(
              color: incidentButtonColor,
              child: Text(
                'Add New Incident Report'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () => Navigator.pushNamed(context, citizenReportCreate))
        ],
      ),
    );
  }

  _showFilter() {
    if (_controller.incidentReportList.isEmpty) {
      showSnackBar('Not Allowed', 'There are no items to filter!', error: true);
      return;
    }

    showFilterBottomSheet(
      context,
      title: 'Filter Results',
      content: Obx(() => _filterContent()),
    );
  }

  Widget _filterContent() {
    return Column(children: [
      // AppDropdownButton(
      //   onChanged: (value) => _controller.setNameFilter(value),
      //   items: const ['Not yet available'],
      //   hintText: 'Filtered by Accident Name',
      // ),
      AppDropdownButton(
        onChanged: (value) => _controller.setTypeFilter(value),
        items: _controller.typeFilterList,
        value: _controller.selectedTypeFilter.value.isEmpty ? null : _controller.selectedTypeFilter.value,
        hintText: 'Filtered by Accident Type',
      ),
      const SizedBox(
        height: size10,
      ),
      AppElevatedButton(
        child: Text(
          'APPLY FILTER',
          style: kHeader3TextStyle.copyWith(color: kWhite),
        ),
        onPressed: () => _controller.filterReports(),
      ),
    ]);
  }

  Widget _myReportsView() {
    return Expanded(
      child: _controller.loadingReports.value
          ? const AppLoadingIndicator()
          : RefreshIndicator(
              onRefresh: () async => _controller.getMyReports(),
              child: ListView.builder(
                  itemCount: _controller.myReportList.length,
                  itemBuilder: (context, index) {
                    final data = _controller.myReportList[index] as CitizenReportModel;
                    return ListItem(
                      onPress: () {
                        Navigator.pushNamed(context, citizenReportDetails, arguments: {'data': data});
                      },
                      title: data.title ?? '',
                      description: 'Reported: ${data.date.timePassed}',
                      status: data.info.status,
                      imageUrl: data.info.thumbPath,
                    );
                  }),
            ),
    );
  }
}
