import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_service.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';

class DiscoverController extends GetxController {
  final DiscoverService service;
  final AppNavigation navigation;

  var isLoadingDirectories = false.obs;
  var isLoadingEstablishments = false.obs;
  var directoryList = [].obs;
  var establishmentList = [].obs;
  List<EstablishmentModel> establishmentListTemp = [];

  DiscoverController(this.service, this.navigation);

  Future<void> getDirectories() async {
    isLoadingDirectories.value = true;
    final response = await service.directories();
    if (response.status) {
      directoryList.value = response.data;
    }
    isLoadingDirectories.value = false;
  }

  Future<void> getEstablishments() async {
    isLoadingEstablishments.value = true;
    final response = await service.establishments();
    if (response.status) {
      establishmentList.value = response.data;
      establishmentListTemp = response.data;
    }
    isLoadingEstablishments.value = false;
  }

  void searchItems(String value) {
    if (value.isEmpty) {
      establishmentList.value = establishmentListTemp;
    } else {
      establishmentList.value =
          establishmentListTemp.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
  }

  void filterEstablishments(String directory) {
    navigation.showSnackBar(AppStrings.notYetImplemented);
  }

  void navigateToDetails(EstablishmentModel data) {}
}
