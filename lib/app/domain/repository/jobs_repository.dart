import 'package:iloilocityapp/app/data/services/network/jobs_services/jobs_api.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/jobs_service.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/models/jobs_response.dart';

class JobsRepository {
  final JobsAPI _api;

  JobsRepository(this._api);

  Future<JobsResponse> allJobs() async {
    return await _api.allJobs();
  }
}
