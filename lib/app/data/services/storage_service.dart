// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static StorageService c = Get.find();
  //Instance of get storage
  final appdata = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void setLoginStorage(userType) {
    appdata.write('userType', userType.toString());
  }

  void removeUserStorage() {
    appdata.erase();
  }
}
