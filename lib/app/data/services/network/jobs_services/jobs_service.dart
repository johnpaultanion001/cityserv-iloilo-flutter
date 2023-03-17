import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/jobs_api.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/jobs_response.dart';

class JobsService extends JobsAPI {
  final NetworkProvider _apiProvider;
  JobsService(this._apiProvider);

  @override
  Future<JobsResponse> allJobs() async {
    String response = await _apiProvider.get(
      '/api/job-hiring/all.json',
    );
    Map<String, dynamic> data = jsonDecode(response);
    return JobsResponse.fromJson(data);
  }

  @override
  Future<JobModel?> applyJob(JobModel data) {
    // TODO: implement applyJob
    throw UnimplementedError();
  }

  @override
  Future<List<JobModel>> jobDetails() {
    // TODO: implement jobDetails
    throw UnimplementedError();
  }
}
