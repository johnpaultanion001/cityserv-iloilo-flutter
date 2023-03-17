import 'dart:convert';

EaseOfBusinessResponse easeOfBusinessResponseFromJson(String str) =>
    EaseOfBusinessResponse.fromJson(json.decode(str));

String easeOfBusinessResponseToJson(EaseOfBusinessResponse data) =>
    json.encode(data.toJson());

class EaseOfBusinessResponse {
  EaseOfBusinessResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.hasMorepage,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<EaseOfBusinessModel> data;
  final bool hasMorepage;

  factory EaseOfBusinessResponse.fromJson(Map<String, dynamic> json) =>
      EaseOfBusinessResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<EaseOfBusinessModel>.from(
            json["data"].map((x) => EaseOfBusinessModel.fromJson(x))),
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

class EaseOfBusinessModel {
  EaseOfBusinessModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.date,
    required this.info,
  });

  final int id;
  final String title;
  final String excerpt;
  final Date date;
  final Info info;

  factory EaseOfBusinessModel.fromJson(Map<String, dynamic> json) =>
      EaseOfBusinessModel(
        id: json["id"],
        title: json["title"],
        excerpt: json["excerpt"],
        date: Date.fromJson(json["date"]),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "excerpt": excerpt,
        "date": date.toJson(),
        "info": info.toJson(),
      };
}

class Date {
  Date({
    required this.dateDb,
    required this.monthYear,
    required this.timePassed,
    required this.timestamp,
  });

  final String dateDb;
  final String monthYear;
  final String timePassed;
  final DateTime timestamp;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        dateDb: json["date_db"],
        monthYear: json["month_year"],
        timePassed: json["time_passed"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "date_db": dateDb,
        "month_year": monthYear,
        "time_passed": timePassed,
        "timestamp": timestamp.toIso8601String(),
      };
}

class Info {
  Info({
    required this.author,
    required this.content,
    required this.path,
    required this.directory,
    required this.fullPath,
    required this.thumbPath,
  });

  final String author;
  final String content;
  final String path;
  final String directory;
  final String fullPath;
  final String thumbPath;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        author: json["author"],
        content: json["content"],
        path: json["path"],
        directory: json["directory"],
        fullPath: json["full_path"],
        thumbPath: json["thumb_path"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "path": path,
        "directory": directory,
        "full_path": fullPath,
        "thumb_path": thumbPath,
      };
}
