import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_service.dart';
import 'package:iloilocityapp/app/domain/entities/home/home_category.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class DashboardController extends GetxController {
  final scrollController = ScrollController();
  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;

  final List<String> imgList = [
    AssetsPath.announcement,
    AssetsPath.magri2,
    AssetsPath.magri1,
    AssetsPath.magri2,
  ];

  final CitizenReportService _service;
  var isLoadingReports = false.obs;
  var incidentReportList = [].obs;

  DashboardController(this._service);

  Future<void> getMyReports() async {
    isLoadingReports.value = true;
    final response = await _service.myReports();
    if (response.status) {
      incidentReportList.value = response.data.where((element) => element.type.toLowerCase() == 'crime').toList();
    }
    isLoadingReports.value = false;
  }

  List<Category> categories = [
    Category(id: '1', title: 'Job \nBulletin', image: AssetsPath.jobBulletin, route: jobBulletin),
    Category(id: '2', title: 'Citizen \nReport', image: AssetsPath.citizenReport, route: citizenReport),
    Category(id: '3', title: 'Citizen \nQR Code', image: AssetsPath.citizenQrCode, route: citizenQRCode),
    Category(id: '4', title: 'Ease of \nBusiness ', image: AssetsPath.easeOfBusiness, route: easeOfBusiness),
    Category(id: '5', title: 'Discover \nIloilo', image: AssetsPath.discover, route: discover),
    Category(id: '6', title: 'My \nMoments', image: AssetsPath.myMoment, route: mymoments),
    Category(id: '7', title: 'Iloilo \nEMR', image: AssetsPath.iloiloCity, route: healthcenteremr),
    Category(id: '8', title: 'News & \nEvents', image: AssetsPath.newsAndEvents, route: newsevents),
  ];

  void navigateToPage(String route) {
    Get.toNamed(route);
  }
}
