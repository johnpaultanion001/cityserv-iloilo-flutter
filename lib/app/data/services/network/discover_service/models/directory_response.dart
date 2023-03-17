import 'dart:convert';

class DirectoryResponse {
  DirectoryResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.hasMorepage,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<DirectoryModel> data;
  final bool hasMorepage;

  factory DirectoryResponse.fromJson(Map<String, dynamic> json) =>
      DirectoryResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<DirectoryModel>.from(
            json["data"].map((x) => DirectoryModel.fromJson(x))),
        hasMorepage: json["has_morepage"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "has_morepage": hasMorepage,
      };
}

class DirectoryModel {
  DirectoryModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory DirectoryModel.fromJson(Map<String, dynamic> json) => DirectoryModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
