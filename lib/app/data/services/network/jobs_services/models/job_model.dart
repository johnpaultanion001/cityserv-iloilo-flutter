import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  JobModel({
    required this.id,
    required this.title,
    required this.allowApplication,
    required this.status,
    required this.numApplied,
    required this.isApplied,
    required this.excerpt,
    required this.employer,
    required this.email,
    required this.contactNumber,
    required this.date,
    required this.info,
  });

  final int id;
  final String title;
  final String allowApplication;
  final String status;
  final String numApplied;
  final bool isApplied;
  final String excerpt;
  final String employer;
  final String email;
  final String contactNumber;
  final Date date;
  final Info info;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        title: json["title"],
        allowApplication: json["allow_application"],
        status: json["status"],
        numApplied: json["num_applied"],
        isApplied: json["is_applied"],
        excerpt: json["excerpt"],
        employer: json["employer"],
        email: json["email"],
        contactNumber: json["contact_number"],
        date: Date.fromJson(json["date"]),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "allow_application": allowApplication,
        "status": status,
        "num_applied": numApplied,
        "is_applied": isApplied,
        "excerpt": excerpt,
        "employer": employer,
        "email": email,
        "contact_number": contactNumber,
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

  final DateTime dateDb;
  final String monthYear;
  final String timePassed;
  final DateTime timestamp;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        dateDb: DateTime.parse(json["date_db"]),
        monthYear: json["month_year"],
        timePassed: json["time_passed"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "date_db":
            "${dateDb.year.toString().padLeft(4, '0')}-${dateDb.month.toString().padLeft(2, '0')}-${dateDb.day.toString().padLeft(2, '0')}",
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
        author: json["author"] ?? '',
        content: json["content"] ?? '',
        path: json["path"] ?? '',
        directory: json["directory"] ?? '',
        fullPath: json["full_path"] ?? '',
        thumbPath: json["thumb_path"] ?? '',
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
