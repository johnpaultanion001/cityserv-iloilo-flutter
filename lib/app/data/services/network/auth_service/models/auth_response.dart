import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.msg,
    required this.status,
    required this.statusCode,
    required this.token,
    required this.firstLogin,
    required this.data,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final String token;
  final bool firstLogin;
  final Data? data;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        msg: json["msg"] ?? '',
        status: json["status"] ?? false,
        statusCode: json["status_code"] ?? '',
        token: json["token"] ?? '',
        firstLogin: json["first_login"] ?? false,
        data: json["data"] != null
            ? Data.fromJson(
                json["data"],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "status_code": statusCode,
        "token": token,
        "first_login": firstLogin,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.email,
    required this.type,
    required this.fbId,
    required this.isVerify,
    required this.raffleId,
  });

  final int id;
  final String username;
  final String email;
  final String type;
  final dynamic fbId;
  final bool isVerify;
  final String raffleId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        type: json["type"] ?? '',
        fbId: json["fb_id"] ?? '',
        isVerify: json["is_verify"] ?? false,
        raffleId: json["raffle_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "type": type,
        "fb_id": fbId,
        "is_verify": isVerify,
        "raffle_id": raffleId,
      };
}
