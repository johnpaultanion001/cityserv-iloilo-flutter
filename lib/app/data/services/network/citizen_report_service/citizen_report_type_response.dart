import 'dart:convert';

CitizenReportTypeResponse citizenReportTypeResponseFromJson(String str) =>
    CitizenReportTypeResponse.fromJson(json.decode(str));

String citizenReportTypeResponseToJson(CitizenReportTypeResponse data) => json.encode(data.toJson());

class CitizenReportTypeResponse {
  CitizenReportTypeResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<CitizenReportType> data;

  factory CitizenReportTypeResponse.fromJson(Map<String, dynamic> json) => CitizenReportTypeResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<CitizenReportType>.from(json["data"].map((x) => CitizenReportType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CitizenReportType {
  CitizenReportType({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory CitizenReportType.fromJson(Map<String, dynamic> json) => CitizenReportType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
