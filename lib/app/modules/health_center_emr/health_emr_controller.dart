import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_service.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/models/establishments_response.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class HealthEMRController extends GetxController {
  final isLoadingEstablishments = false.obs;
  final establishmentList = [].obs;
  List<EstablishmentModel> establishmentListTemp = [];
  final DiscoverService service;
  final AppNavigation navigation;
  HealthEMRController(this.service, this.navigation);

  Future<void> getEstablishments() async {
    isLoadingEstablishments.value = true;
    try {
      final response = await service.establishments();
      if (response.status) {
        establishmentList.value = response.data;
        establishmentListTemp = response.data;
      }
    } on Exception catch (_) {
      handleError(message: 'Unable to get establishments.');
    }
    isLoadingEstablishments.value = false;
  }

  void navigateToDetails(EstablishmentModel data) {
    navigation.navigateToNamed(healthcenteremrdetails, arguments: {'data': data});
  }

  void searchItems(String value) {
    if (value.isEmpty) {
      establishmentList.value = establishmentListTemp;
    } else {
      establishmentList.value =
          establishmentListTemp.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
  }
}
