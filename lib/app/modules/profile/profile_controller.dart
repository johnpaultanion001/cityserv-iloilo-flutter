import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_api.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';

class ProfileController extends GetxController {
  final ProfileService _service;

  var profileData = {}.obs;
  var loadingProfile = false.obs;

  ProfileController(this._service);

  Future<dynamic> getProfileData() async {
    loadingProfile.value = true;
    try {
      final response = await _service.profileData();
      if (response.status) {
        profileData.value = {'data': response.data};
      }
    } on Exception catch (_) {
      handleError(message: 'Unable to get profile data.');
    }
    loadingProfile.value = false;
  }
}
