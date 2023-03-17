// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CitizenReport {
  String title;
  String description;
  String status;
  String imageUrl;
  String reportType;
  DateTime reportDate;
  DateTime resolvedDate;
  CitizenReport({
    required this.title,
    required this.description,
    required this.status,
    required this.imageUrl,
    required this.reportType,
    required this.reportDate,
    required this.resolvedDate,
  });

  static CitizenReport sample() {
    return CitizenReport(
      imageUrl:
          'https://media.wired.com/photos/5d09594a62bcb0c9752779d9/16:9/w_2000,h_1125,c_limit/Transpo_G70_TA-518126.jpg',
      title: 'Car Accident',
      description: "5 minutes ago",
      reportType: 'Accident',
      reportDate: DateTime.now(),
      resolvedDate: DateTime.now(),
      status: 'Resolved',
    );
  }

  CitizenReport copyWith({
    String? title,
    String? description,
    String? status,
    String? imageUrl,
    String? reportType,
    DateTime? reportDate,
    DateTime? resolvedDate,
  }) {
    return CitizenReport(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      reportType: reportType ?? this.reportType,
      reportDate: reportDate ?? this.reportDate,
      resolvedDate: resolvedDate ?? this.resolvedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'status': status,
      'imageUrl': imageUrl,
      'reportType': reportType,
      'reportDate': reportDate.millisecondsSinceEpoch,
      'resolvedDate': resolvedDate.millisecondsSinceEpoch,
    };
  }

  factory CitizenReport.fromMap(Map<String, dynamic> map) {
    return CitizenReport(
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      imageUrl: map['imageUrl'] as String,
      reportType: map['reportType'] as String,
      reportDate: DateTime.fromMillisecondsSinceEpoch(map['reportDate'] as int),
      resolvedDate:
          DateTime.fromMillisecondsSinceEpoch(map['resolvedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CitizenReport.fromJson(String source) =>
      CitizenReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CitizenReport(title: $title, description: $description, status: $status, imageUrl: $imageUrl, reportType: $reportType, reportDate: $reportDate, resolvedDate: $resolvedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CitizenReport &&
        other.title == title &&
        other.description == description &&
        other.status == status &&
        other.imageUrl == imageUrl &&
        other.reportType == reportType &&
        other.reportDate == reportDate &&
        other.resolvedDate == resolvedDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        status.hashCode ^
        imageUrl.hashCode ^
        reportType.hashCode ^
        reportDate.hashCode ^
        resolvedDate.hashCode;
  }
}
