// To parse this JSON data, do
//
//     final citizenReportResponse = citizenReportResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CitizenReportResponse citizenReportResponseFromJson(String str) => CitizenReportResponse.fromJson(json.decode(str));

String citizenReportResponseToJson(CitizenReportResponse data) => json.encode(data.toJson());

class CitizenReportResponse {
  CitizenReportResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.hasMorepage,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<CitizenReportModel> data;
  final bool hasMorepage;

  factory CitizenReportResponse.fromJson(Map<String, dynamic> json) => CitizenReportResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<CitizenReportModel>.from(json["data"].map((x) => CitizenReportModel.fromJson(x))),
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

class CitizenReportModel {
  CitizenReportModel({
    required this.id,
    required this.type,
    required this.title,
    required this.excerpt,
    required this.date,
    required this.info,
  });

  final int id;
  final String type;
  final dynamic title;
  final String excerpt;
  final Date date;
  final Info info;

  factory CitizenReportModel.fromJson(Map<String, dynamic> json) => CitizenReportModel(
        id: json["id"],
        type: json["type"] ?? '',
        title: json["title"] ?? '',
        excerpt: json["excerpt"] ?? '',
        date: Date.fromJson(json["date"]),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
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
    required this.lastUpdated,
  });

  final DateTime dateDb;
  final String monthYear;
  final String timePassed;
  final DateTime timestamp;
  final DateTime lastUpdated;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        dateDb: DateTime.parse(json["date_db"]),
        monthYear: json["month_year"],
        timePassed: json["time_passed"],
        timestamp: DateTime.parse(json["timestamp"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "date_db":
            "${dateDb.year.toString().padLeft(4, '0')}-${dateDb.month.toString().padLeft(2, '0')}-${dateDb.day.toString().padLeft(2, '0')}",
        "month_year": monthYear,
        "time_passed": timePassed,
        "timestamp": timestamp.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Info {
  Info({
    required this.sender,
    required this.status,
    required this.code,
    required this.content,
    required this.geolocation,
    required this.path,
    required this.directory,
    required this.fullPath,
    required this.thumbPath,
  });

  final String sender;
  final String status;
  final String code;
  final String content;
  final Geolocation geolocation;
  final String path;
  final String directory;
  final String fullPath;
  final String thumbPath;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        sender: json["sender"] ?? '',
        status: json["status"] ?? '',
        code: json["code"] ?? '',
        content: json["content"] ?? '',
        geolocation: Geolocation.fromJson(json["geolocation"]),
        path: json["path"] ?? '',
        directory: json["directory"] ?? '',
        fullPath: json["full_path"] ?? '',
        thumbPath: json["thumb_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "status": status,
        "code": code,
        "content": content,
        "geolocation": geolocation.toJson(),
        "path": path,
        "directory": directory,
        "full_path": fullPath,
        "thumb_path": thumbPath,
      };
}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.long,
  });

  final String lat;
  final String long;

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}
