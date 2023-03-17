import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/jobs_response.dart';

abstract class JobsAPI {
  Future<JobsResponse> allJobs();
  Future<List<JobModel>> jobDetails();
  Future<JobModel?> applyJob(JobModel data);
}
