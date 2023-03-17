import 'dart:convert';

ArticleResponse articleResponseFromJson(String str) => ArticleResponse.fromJson(json.decode(str));

String articleResponseToJson(ArticleResponse data) => json.encode(data.toJson());

class ArticleResponse {
  ArticleResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<ArticleModel> data;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => ArticleResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<ArticleModel>.from(json["data"].map((x) => ArticleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ArticleModel {
  ArticleModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.info,
    required this.date,
  });

  final int id;
  final String title;
  final String excerpt;
  final Info info;
  final Date date;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        title: json["title"],
        excerpt: json["excerpt"],
        info: Info.fromJson(json["info"]),
        date: Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "excerpt": excerpt,
        "info": info.toJson(),
        "date": date.toJson(),
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
        dateDb: json["date_db"] ?? '',
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
