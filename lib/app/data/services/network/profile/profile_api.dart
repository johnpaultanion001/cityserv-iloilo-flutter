import 'package:iloilocityapp/app/data/services/network/profile/profile_response.dart';

abstract class ProfileService {
  Future<ProfileResponse> profileData();
}
