import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/ease_of_business_service.dart';

class EaseOfBusinessController extends GetxController {
  var loadingBusiness = false.obs;
  var businessList = [].obs;

  final EaseOfBusinessService _service;
  EaseOfBusinessController(this._service);
  Future<void> getAllBusiness() async {
    loadingBusiness.value = true;
    final response = await _service.allBusiness();
    if (response.status) {
      businessList.value = response.data;
    }
    loadingBusiness.value = false;
  }
}
