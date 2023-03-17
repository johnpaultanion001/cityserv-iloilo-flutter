import 'dart:convert';

class EstablishmentsResponse {
  EstablishmentsResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.hasMorepage,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final List<EstablishmentModel> data;
  final bool hasMorepage;

  factory EstablishmentsResponse.fromJson(Map<String, dynamic> json) => EstablishmentsResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: List<EstablishmentModel>.from(json["data"].map((x) => EstablishmentModel.fromJson(x))),
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

class EstablishmentModel {
  EstablishmentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.address,
    required this.contact,
    required this.geolocation,
    required this.directory,
    required this.date,
    required this.thumb_path,
    required this.full_path,
  });

  final int id;
  final String name;
  final String email;
  final EstablishmentImage image;
  final String address;
  final String contact;
  final Geolocation geolocation;
  final Directory directory;
  final Date date;
  final String full_path;
  final String thumb_path;

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) => EstablishmentModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        image: EstablishmentImage.fromJson(json["image"]),
        address: json["address"] ?? '',
        contact: json["contact"] ?? '',
        geolocation: Geolocation.fromJson(json["geolocation"]),
        directory: Directory.fromJson(json["directory"]),
        date: Date.fromJson(json["date"]),
        full_path: json["full_path"] ?? '',
        thumb_path: json["thumb_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image.toJson(),
        "address": address,
        "contact": contact,
        "geolocation": geolocation.toJson(),
        "directory": directory.toJson(),
        "date": date.toJson(),
        "full_path": full_path,
        "thumb_path": thumb_path,
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
        dateDb: json["date_db"] != null ? DateTime.parse(json["date_db"]) : DateTime.now(),
        monthYear: json["month_year"] ?? '',
        timePassed: json["time_passed"] ?? '',
        timestamp: json["timestamp"] != null ? DateTime.parse(json["timestamp"]) : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "date_db":
            "${dateDb.year.toString().padLeft(4, '0')}-${dateDb.month.toString().padLeft(2, '0')}-${dateDb.day.toString().padLeft(2, '0')}",
        "month_year": monthYear,
        "time_passed": timePassed,
        "timestamp": timestamp.toIso8601String(),
      };
}

class Directory {
  Directory({
    required this.id,
    required this.title,
    required this.path,
    required this.filename,
    required this.source,
    required this.directory,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final String title;
  final String path;
  final String filename;
  final String source;
  final String directory;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String deletedAt;

  factory Directory.fromJson(Map<String, dynamic> json) => Directory(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        path: json["path"] ?? '',
        filename: json["filename"] ?? '',
        source: json["source"] ?? '',
        directory: json["directory"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
        deletedAt: json["deleted_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "path": path,
        "filename": filename,
        "source": source,
        "directory": directory,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
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
        lat: json["lat"] ?? '',
        long: json["long"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class EstablishmentImage {
  EstablishmentImage({
    required this.directory,
    required this.filename,
    required this.path,
  });

  final Directory? directory;
  final String filename;
  final String path;

  factory EstablishmentImage.fromJson(Map<String, dynamic> json) => EstablishmentImage(
        directory: json["directory"] != null ? Directory.fromJson(json["directory"]) : null,
        filename: json["filename"] ?? '',
        path: json["path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "directory": directory?.toJson(),
        "filename": filename,
        "path": path,
      };
}
