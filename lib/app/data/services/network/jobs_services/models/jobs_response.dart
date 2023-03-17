import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/jobs_services/models/job_model.dart';

class JobsResponse {
  JobsResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.hasMorepage,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<JobModel> data;
  final bool hasMorepage;

  factory JobsResponse.fromJson(Map<String, dynamic> json) => JobsResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data:
            List<JobModel>.from(json["data"].map((x) => JobModel.fromJson(x))),
        hasMorepage: json["has_morepage"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": List<JobModel>.from(data.map((x) => x)),
        "has_morepage": hasMorepage,
      };
}
