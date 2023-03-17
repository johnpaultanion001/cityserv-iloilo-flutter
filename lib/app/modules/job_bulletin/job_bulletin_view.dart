import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/empty_result.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/list_item.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';
import 'package:iloilocityapp/app/modules/job_bulletin/jobs_controller.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class JobBulletinView extends StatefulWidget {
  const JobBulletinView({Key? key}) : super(key: key);

  @override
  State<JobBulletinView> createState() => _JobBulletinViewState();
}

class _JobBulletinViewState extends State<JobBulletinView> {
  final _controller = getIt<JobsController>();

  @override
  void initState() {
    super.initState();
    _controller.getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
      title: 'Job Bulletin',
      subTitle: 'View New Job Openings',
      content: Column(
        children: [
          ListHeader(
            horizontalPadding: 0,
            title: 'Job Openings',
            onPressed: () => _showFilter(),
          ),
          Obx(() => _jobsView()),
        ],
      ),
    );
  }

  _showFilter() {
    showFilterBottomSheet(context, title: 'Filter Results', content: Obx(() => filterContent()));
  }

  Widget _jobsView() {
    return _controller.loadingAllJobs.value
        ? const Center(child: CircularProgressIndicator())
        : Expanded(
            child: RefreshIndicator(
              onRefresh: () async => await _controller.getAllJobs(),
              child: _controller.allJobs.isEmpty
                  ? const EmptyResultView()
                  : ListView.builder(
                      itemCount: _controller.allJobs.length,
                      itemBuilder: (context, index) {
                        JobModel job = _controller.allJobs[index];

                        return ListItem(
                            onPress: () {
                              Navigator.pushNamed(context, jobOpeningDetails, arguments: {'data': job});
                            },
                            title: job.title,
                            description: 'by ${job.employer}',
                            status: '',
                            imageUrl: job.info.thumbPath);
                      }),
            ),
          );
  }

  Widget filterContent() {
    return Column(children: [
      AppDropdownButton(
        value: _controller.selectedTitle.isEmpty ? null : _controller.selectedTitle.value,
        onChanged: (value) => _controller.updateTitleFilter(value),
        items: _controller.titleList,
        hintText: 'Filtered by Job Title Name',
      ),
      AppDropdownButton(
        value: _controller.selectedCompany.isEmpty ? null : _controller.selectedCompany.value,
        onChanged: (value) => _controller.updateCompanyFilter(value),
        items: _controller.companyList,
        hintText: 'Filtered by Company Name',
      ),
      const SizedBox(
        height: size10,
      ),
      AppElevatedButton(
        child: Text(
          'APPLY FILTER',
          style: kHeader3TextStyle.copyWith(color: kWhite),
        ),
        onPressed: () {
          _controller.fiterJobs();
          Navigator.pop(context);
        },
      ),
    ]);
  }
}
