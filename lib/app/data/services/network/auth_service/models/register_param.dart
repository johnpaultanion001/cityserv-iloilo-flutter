class RegisterParam {
  RegisterParam({
    required this.email,
    required this.fname,
    required this.lname,
    required this.contactNumber,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
    required this.civilStatus,
    required this.birthday,
    required this.region,
    required this.province,
    required this.city,
    required this.barangay,
    required this.address,
    required this.zipCode,
  });

  final String email;
  final String fname;
  final String lname;
  final String contactNumber;
  final String password;
  final String passwordConfirmation;
  final String gender;
  final String civilStatus;
  final String birthday;
  final String region;
  final String province;
  final String city;
  final String barangay;
  final String address;
  final String zipCode;

  Map<String, dynamic> toJson() => {
        "email": email,
        "fname": fname,
        "lname": lname,
        "contact_number": contactNumber,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "gender": gender,
        "civil_status": civilStatus,
        "birthday": birthday,
        "region": region,
        "province": province,
        "city": city,
        "barangay": barangay,
        "address": address,
        "zip_code": zipCode,
      };
}
