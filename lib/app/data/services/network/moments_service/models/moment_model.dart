class MomentModel {
  MomentModel({
    required this.id,
    required this.excerpt,
    required this.info,
    required this.date,
  });

  final int id;
  final String excerpt;
  final Info info;
  final Date date;

  factory MomentModel.fromJson(Map<String, dynamic> json) => MomentModel(
        id: json["id"],
        excerpt: json["excerpt"],
        info: Info.fromJson(json["info"]),
        date: Date.fromJson(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
    required this.sender,
    required this.status,
    required this.content,
    required this.path,
    required this.directory,
    required this.fullPath,
    required this.thumbPath,
  });

  final String sender;
  final String status;
  final String content;
  final String path;
  final String directory;
  final String fullPath;
  final String thumbPath;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        sender: json["sender"] ?? '',
        status: json["status"] ?? '',
        content: json["content"] ?? '',
        path: json["path"] ?? '',
        directory: json["directory"] ?? '',
        fullPath: json["full_path"] ?? '',
        thumbPath: json["thumb_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "status": status,
        "content": content,
        "path": path,
        "directory": directory,
        "full_path": fullPath,
        "thumb_path": thumbPath,
      };
}
