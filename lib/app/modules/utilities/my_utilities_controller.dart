import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class MyUtilitiesController extends GetxController {
  final AppNavigation navigation;
  MyUtilitiesController(this.navigation);

  void navigateToDetails(int id) {
    navigation.showSnackBar(AppStrings.notYetImplemented);
    // Todo: Page is not yet implemented.
  }

  final scrollController = ScrollController();

  RxList<Utilitites> utilititesList = <Utilitites>[
    Utilitites(
      id: '1',
      title: 'MORE Electric and Power \nCorporation',
      image: AssetsPath.morePower,
      date: '5 mins ago',
      status: 'Electricty Bill',
    ),
    Utilitites(
      id: '2',
      title: 'Metro Pacific Iloilo',
      image: AssetsPath.metroPacific,
      date: '3 weeks ago',
      status: 'Water Bill',
    ),
    Utilitites(
      id: '3',
      title: 'Iloilo Market',
      image: AssetsPath.emarket,
      date: '1 Month ago',
      status: 'eCommerce',
    ),
  ].obs;
}

class Utilitites {
  String? id;
  String? title;
  String? image;
  String? date;
  String? status;

  Utilitites({this.id, this.title, this.image, this.date, this.status});
}
