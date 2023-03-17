class LoginParams {
  LoginParams({
    required this.email,
    required this.password,
    this.deviceId = '',
    this.deviceRegId = '',
    this.deviceName = '',
  });

  final String email;
  final String password;
  final String deviceId;
  final String deviceRegId;
  final String deviceName;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "device_reg_id": deviceRegId,
        "device_name": deviceName,
      };
}
