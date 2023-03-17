import 'dart:convert';

class ProfileResponse {
  ProfileResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.data,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final ProfileModel data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        msg: json["msg"],
        status: json["status"],
        statusCode: json["status_code"],
        data: ProfileModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.username,
    required this.email,
    required this.type,
    required this.fbId,
    required this.isVerify,
    required this.raffleId,
    required this.civilStatus,
    required this.birthday,
    required this.province,
    required this.city,
    required this.barangay,
    required this.qrReferenceCode,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String username;
  final String email;
  final String type;
  final dynamic fbId;
  final bool isVerify;
  final String raffleId;
  final dynamic civilStatus;
  final dynamic birthday;
  final dynamic province;
  final dynamic city;
  final dynamic barangay;
  final dynamic qrReferenceCode;

  String get completeName => '${firstName} ${lastName}';

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        contactNumber: json["contact_number"],
        username: json["username"],
        email: json["email"],
        type: json["type"],
        fbId: json["fb_id"],
        isVerify: json["is_verify"],
        raffleId: json["raffle_id"],
        civilStatus: json["civil_status"],
        birthday: json["birthday"],
        province: json["province"],
        city: json["city"],
        barangay: json["barangay"],
        qrReferenceCode: json["qr_reference_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "contact_number": contactNumber,
        "username": username,
        "email": email,
        "type": type,
        "fb_id": fbId,
        "is_verify": isVerify,
        "raffle_id": raffleId,
        "civil_status": civilStatus,
        "birthday": birthday,
        "province": province,
        "city": city,
        "barangay": barangay,
        "qr_reference_code": qrReferenceCode,
      };
}
