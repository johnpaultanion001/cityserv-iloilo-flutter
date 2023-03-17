import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/models/register_param.dart';
import 'package:iloilocityapp/app/data/storage/auth_data.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/domain/repository/auth_repository.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class SignUpController extends GetxController {
  var dropDownGenderValue = ''.obs;
  var dropDownCivilStatusValue = ''.obs;
  var dropDownRegionValue = ''.obs;
  var dropDownProvinceValue = ''.obs;
  var dropDownCityValue = ''.obs;
  var dropDownBarangayValue = ''.obs;
  var isLoading = false.obs;

  var selectedGender = Gender();
  var selectedStatus = CivilStatus();
  var selectedRegion = Region();
  var selectedProvince = Province();
  var selectedCity = City();
  var selectedBarangay = Barangay();

  final AuthRepository _authRepository;
  final AppNavigation navigation;
  final AuthData authData;

  SignUpController(this._authRepository, this.navigation, this.authData);

  Future signUpUser(RegisterParam data) async {
    print("test" + data.toString());
    if (data.password != data.passwordConfirmation) {
      navigation.showSnackBar(
          title: AppStrings.error, 'Password did not match.', error: true);
      return;
    }

    if (data.password.length <= 4) {
      navigation.showSnackBar(
          title: AppStrings.error,
          'Password must be 5 characters above.',
          error: true);
      return;
    }

    isLoading.value = true;
    try {
      var response = await _authRepository.register(data);
      if (response != null) {
        showSnackBar(AppStrings.success, AppStrings.registerSuccessful);
        authData.saveAuthData(jsonEncode(response.toJson()));
        Get.offAllNamed(bottomnav);
      } else {
        showSnackBar(AppStrings.failed, AppStrings.somethingWentWrong);
      }
    } on DioError catch (e) {
      print(e);
      print(e.response);
      handleError(message: 'Failed to sign-up user!');
    }
    isLoading.value = false;
  }

  RxList<CivilStatus> statusList = <CivilStatus>[
    CivilStatus(
      id: '1',
      type: 'Single',
    ),
    CivilStatus(
      id: '2',
      type: 'Married',
    ),
    CivilStatus(
      id: '3',
      type: 'Separeted',
    ),
  ].obs;
  RxList<Gender> genderList = <Gender>[
    Gender(
      id: '1',
      type: 'Female',
    ),
    Gender(
      id: '2',
      type: 'Male',
    ),
  ].obs;
  RxList<Region> regionList = <Region>[
    Region(
      id: '1',
      type: 'Region 1',
    ),
    Region(
      id: '2',
      type: 'Region 2',
    ),
  ].obs;
  RxList<Province> provinceList = <Province>[
    Province(
      id: '1',
      type: 'Province 1',
    ),
    Province(
      id: '2',
      type: 'Province 2',
    ),
  ].obs;
  RxList<City> cityList = <City>[
    City(
      id: '1',
      type: 'City 1',
    ),
    City(
      id: '2',
      type: 'City 2',
    ),
    City(
      id: '2',
      type: 'City 3',
    ),
  ].obs;
  RxList<Barangay> barangayList = <Barangay>[
    Barangay(
      id: '1',
      type: 'Barangay 1',
    ),
    Barangay(
      id: '2',
      type: 'Barangay 2',
    ),
    Barangay(
      id: '1',
      type: 'Barangay 3',
    ),
    Barangay(
      id: '2',
      type: 'Barangay 4',
    ),
  ].obs;
}

class CivilStatus {
  String? id;
  String? type;

  CivilStatus({
    this.id,
    this.type,
  });
}

class Gender {
  String? id;
  String? type;

  Gender({
    this.id,
    this.type,
  });
}

class Region {
  String? id;
  String? type;

  Region({
    this.id,
    this.type,
  });
}

class Province {
  String? id;
  String? type;

  Province({
    this.id,
    this.type,
  });
}

class City {
  String? id;
  String? type;

  City({
    this.id,
    this.type,
  });
}

class Barangay {
  String? id;
  String? type;

  Barangay({
    this.id,
    this.type,
  });
}
