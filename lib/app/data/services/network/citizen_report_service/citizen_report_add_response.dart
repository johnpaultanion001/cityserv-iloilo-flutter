import 'dart:convert';

CitizenReportAddResponse citizenReportAddResponseFromJson(String str) =>
    CitizenReportAddResponse.fromJson(json.decode(str));

String citizenReportAddResponseToJson(CitizenReportAddResponse data) => json.encode(data.toJson());

class CitizenReportAddResponse {
  CitizenReportAddResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
  });

  final String msg;
  final bool status;
  final String statusCode;

  factory CitizenReportAddResponse.fromJson(Map<String, dynamic> json) => CitizenReportAddResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
      };
}
