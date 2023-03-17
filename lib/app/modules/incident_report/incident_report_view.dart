import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/global/widgets/custom_button.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class IncidentRportView extends StatefulWidget {
  const IncidentRportView({Key? key}) : super(key: key);

  @override
  State<IncidentRportView> createState() => _IncidentRportViewState();
}

class _IncidentRportViewState extends State<IncidentRportView> {
  final _report = CitizenReport.sample();
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListItem(
                      onPress: () {
                        Navigator.pushNamed(context, incidentReportDetails, arguments: {'data': _report});
                      },
                      title: _report.title,
                      description: 'Reported: ${_report.description}',
                      status: _report.status,
                      imageUrl: _report.imageUrl,
                    );
                  }),
            ),
          ),
          AppElevatedButton(
              color: incidentButtonColor,
              child: Text(
                'Add New Incident Report'.toUpperCase(),
                style: kHeader3TextStyle.copyWith(color: kWhite),
              ),
              onPressed: () => Navigator.pushNamed(context, incidentReportCreate)),
        ],
      ),
    );
  }

  _showFilter() {
    showFilterBottomSheet(context,
        title: 'Filter Results',
        content: Column(children: [
          AppDropdownButton(
            onChanged: (value) {},
            items: const ['Title'],
            hintText: 'Filtered by Accident Name',
          ),
          AppDropdownButton(
            onChanged: (value) {},
            items: const ['Type'],
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
            onPressed: () {},
          ),
        ]));
  }
}
