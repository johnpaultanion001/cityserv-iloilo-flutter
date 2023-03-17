import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';
import 'package:iloilocityapp/app/domain/repository/jobs_repository.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';

class JobsController extends GetxController {
  final JobsRepository _jobsRepository;
  final AppNavigation _navigation;
  var loadingAllJobs = false.obs;
  List<JobModel> allJobsRepository = [];
  var allJobs = <JobModel>[].obs;
  var titleList = <String>[].obs;
  var companyList = <String>[].obs;

  var selectedTitle = ''.obs;
  var selectedCompany = ''.obs;

  JobsController(this._jobsRepository, this._navigation);

  Future getAllJobs() async {
    loadingAllJobs.value = true;
    try {
      clearFilters();
      var jobData = await _jobsRepository.allJobs();
      allJobsRepository = jobData.data;
      allJobs.value = allJobsRepository;

      titleList.value = allJobsRepository.map((e) => e.title).toSet().toList();
      companyList.value = allJobsRepository.map((e) => e.employer).toSet().toList();
    } on Exception catch (e) {
      _navigation.showErrorMessage(e.toString());
    } finally {
      loadingAllJobs.value = false;
    }
  }

  void clearFilters() {
    selectedTitle.value = '';
    selectedCompany.value = '';
  }

  void updateTitleFilter(String value) {
    selectedTitle.value = value;
  }

  void updateCompanyFilter(String value) {
    selectedCompany.value = value;
  }

  void fiterJobs() {
    if (selectedTitle.isEmpty && selectedCompany.isEmpty) {
      return;
    }
    if (selectedTitle.isNotEmpty && selectedCompany.isEmpty) {
      allJobs.value = allJobsRepository
          .where((element) => element.title.toLowerCase() == selectedTitle.value.toLowerCase())
          .toList();
      return;
    }
    if (selectedTitle.isEmpty && selectedCompany.isNotEmpty) {
      allJobs.value = allJobsRepository
          .where((element) => element.employer.toLowerCase() == selectedCompany.value.toLowerCase())
          .toList();
    } else {
      allJobs.value = allJobsRepository
          .where((element) =>
              element.title.toLowerCase() == selectedTitle.value.toLowerCase() &&
              element.employer.toLowerCase() == selectedCompany.value.toLowerCase())
          .toList();
    }
  }
}
