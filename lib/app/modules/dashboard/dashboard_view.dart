import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/widgets/custom_background.dart';
import 'package:iloilocityapp/app/global/widgets/custom_filter.dart';
import 'package:iloilocityapp/app/global/widgets/custom_header.dart';
import 'package:iloilocityapp/app/global/widgets/custom_listitem.dart';
import 'package:iloilocityapp/app/modules/dashboard/incident_report_view.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_controller.dart';
import 'package:iloilocityapp/app/modules/dashboard/widgets/carousel_view.dart';
import 'package:iloilocityapp/app/modules/dashboard/widgets/dashboard_categories.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final controller = getIt<DashboardController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(
              isBackVisible: false,
              headerText: 'Welcome to the',
              mainText: 'Iloilo City App',
              isLogoVisible: true,
              isDashBorad: true,
              mainTextSize: 22,
            ),
            DashboardCarouselView(controller: controller),
            const SizedBox(height: 20),
            DashboardCategories(controller: controller),
            const SizedBox(height: 20),
            const IncidentReportView()
          ],
        ),
      ),
    );
  }
}
