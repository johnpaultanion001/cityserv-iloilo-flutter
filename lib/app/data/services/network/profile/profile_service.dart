import 'dart:convert';

import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_api.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_response.dart';

class ProfileApi extends ProfileService {
  final NetworkProvider _provider;
  ProfileApi(this._provider);

  @override
  Future<ProfileResponse> profileData() async {
    String response = await _provider.get('/api/user/profile.json');
    return ProfileResponse.fromJson(jsonDecode(response));
  }
}
