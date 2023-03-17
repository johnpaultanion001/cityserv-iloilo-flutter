class Endpoints {
  //Encrypted = aHR0cDovL2RlbW8uaWxvaWxvLmNpdHlzZXJ2Lm9uZXNlcnYucGg=
  static const String baseUrl =
      "https://develop.cityserve-iloilo.highlysucceed.com/"; //Decrypted
  // static const String baseUrl = "http://test.com"; //Decrypted
  //Encrypted = L2FwaS9hdXRoL2xvZ2luLmpzb24=
  static const String login = "$baseUrl/api/auth/login.json"; //Decrypted
  //Encrypted = L2FwaS9hdXRoL3JlZ2lzdGVyLmpzb24
  static const String signup = "$baseUrl/api/auth/register.json"; //Decrypted
  //Encrypted = L2FwaS9hdXRoL2ZvcmdvdC1wYXNzd29yZC5qc29u
  static const String forgotPassword =
      "$baseUrl/api/auth/forgot-password.json"; //Decrypted
  //Encrypted = L2FwaS9hdXRoL3Jlc2V0LXBhc3N3b3JkLmpzb24
  static const String resetPassword =
      "$baseUrl/api/auth/reset-password.json"; //Decrypted
  //Encrypted = L2FwaS9hdXRoL2xvZ291dC5qc29u
  static const String logout = "$baseUrl/api/auth/logout.json"; //Decrypted
  //Encrypted = L2FwaS9tb21lbnQvbXktbW9tZW50cy5qc29u
  static const String mymoment =
      "$baseUrl/api/moment/my-moments.json"; //Decrypted
  //Encrypted = L2FwaS9tb21lbnQvY3JlYXRlLmpzb24
  static const String createmoment =
      "$baseUrl/api/moment/create.json"; //Decrypted
  //Encrypted = L2FwaS9tb21lbnQvZGVsZXRlLmpzb24
  static const String deletemoment =
      "$baseUrl/api/moment/delete.json"; //Decrypted
  //Encrypted = L2FwaS9jaXRpemVuLXJlcXVlc3QvY3JlYXRlLmpzb24
  static const String createcitizenreport =
      "$baseUrl/api/citizen-request/create.json"; //Decrypted
  //Encrypted = L2FwaS9jaXRpemVuLXJlcXVlc3Qvc2hvdy5qc29u
  static const String showcitizenreport =
      "$baseUrl/api/citizen-request/show.json"; //Decrypted
  //Encrypted =L2FwaS9jaXRpemVuLXJlcXVlc3QvbXktcmVxdWVzdHMuanNvbg
  static const String myrequestcitizenrequest =
      "$baseUrl/api/citizen-request/my-requests.json"; //Decrypted
  //Encrypted =L2FwaS91c2VyL3VwZGF0ZS9maWVsZC5qc29u
  static const String fielduser =
      "$baseUrl/api/user/update/field.json"; //Decrypted
  //Encrypted =L2FwaS91c2VyL3VwZGF0ZS9wYXNzd29yZC5qc29u
  static const String passworduser =
      "$baseUrl/api/user/update/password.json"; //Decrypted
  //Encrypted =L2FwaS9jaXRpemVuLXJlcG9ydC9jcmVhdGUuanNvbg==
  static const String createreport =
      "$baseUrl/api/citizen-report/create.json"; //Decrypted
  //Encrypted =L2FwaS9jaXRpemVuLXJlcG9ydC9teS1yZXBvcnRzLmpzb24=
  static const String myreport =
      "$baseUrl/api/citizen-report/my-reports.json"; //Decrypted
  //Encrypted =L2FwaS9jaXRpemVuLXJlcG9ydC9zaG93Lmpzb24=
  static const String showreport =
      "$baseUrl/api/citizen-report/show.json"; //Decrypted
  //Encrypted =L2FwaS9jaXRpemVuLXJlcG9ydC90eXBlLmpzb24=
  static const String reporttype =
      "$baseUrl/api/citizen-report/type.json"; //Decrypted
  //Encrypted =L2FwaS9qb2ItaGlyaW5nL2FsbC5qc29u
  static const String joblist = "$baseUrl/api/job-hiring/all.json"; //Decrypted
  //Encrypted =L2FwaS9hdXRoL3JlZnJlc2gtdG9rZW4uanNvbg==
  static const String refreshtoken =
      "$baseUrl/api/auth/refresh-token.json"; //Decrypted
  //Encrypted =L2FwaS9qb2ItaGlyaW5nL2FwcGx5Lmpzb24=
  static const String applyjob =
      "$baseUrl/api/job-hiring/apply.json"; //Decrypted
  //Encrypted =L2FwaS9qb2ItaGlyaW5nL2FwcGx5Lmpzb24=
  static const String alltourism = "$baseUrl/api/tourism/all.json"; //Decrypted
  //Encrypted =L2FwaS9zZXJ2aWNlL3Nob3cuanNvbg==
  static const String servicadetail =
      "$baseUrl/api/service/show.json"; //Decrypted
}
