import 'dart:convert';

class JobBulletin {
  String title;
  String employer;
  String details;
  String contactNumber;
  String email;
  String status;
  String imageUrl;
  JobBulletin({
    required this.title,
    required this.employer,
    required this.details,
    required this.contactNumber,
    required this.email,
    required this.status,
    required this.imageUrl,
  });

  static JobBulletin sample() {
    return JobBulletin(
        imageUrl:
            'https://media.wired.com/photos/5d09594a62bcb0c9752779d9/16:9/w_2000,h_1125,c_limit/Transpo_G70_TA-518126.jpg',
        title: 'Flutter dev',
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        employer: 'by Top Gear',
        status: '',
        email: 'test@gmail.com',
        contactNumber: '+639976691234');
  }

  JobBulletin copyWith({
    String? title,
    String? employer,
    String? details,
    String? contactNumber,
    String? email,
    String? status,
    String? imageUrl,
  }) {
    return JobBulletin(
      title: title ?? this.title,
      employer: employer ?? this.employer,
      details: details ?? this.details,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'employer': employer,
      'details': details,
      'contactNumber': contactNumber,
      'email': email,
      'status': status,
      'imageUrl': imageUrl,
    };
  }

  factory JobBulletin.fromMap(Map<String, dynamic> map) {
    return JobBulletin(
      title: map['title'] as String,
      employer: map['employer'] as String,
      details: map['details'] as String,
      contactNumber: map['contactNumber'] as String,
      email: map['email'] as String,
      status: map['status'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobBulletin.fromJson(String source) =>
      JobBulletin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobBulletin(title: $title, employer: $employer, details: $details, contactNumber: $contactNumber, email: $email, status: $status, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JobBulletin &&
        other.title == title &&
        other.employer == employer &&
        other.details == details &&
        other.contactNumber == contactNumber &&
        other.email == email &&
        other.status == status &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        employer.hashCode ^
        details.hashCode ^
        contactNumber.hashCode ^
        email.hashCode ^
        status.hashCode ^
        imageUrl.hashCode;
  }
}
