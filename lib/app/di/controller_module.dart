import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_controller.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_controller.dart';
import 'package:iloilocityapp/app/modules/discover/discover_controller.dart';
import 'package:iloilocityapp/app/modules/ease_of_business/ease_of_business_controller.dart';
import 'package:iloilocityapp/app/modules/health_center_emr/health_emr_controller.dart';
import 'package:iloilocityapp/app/modules/job_bulletin/jobs_controller.dart';
import 'package:iloilocityapp/app/modules/login/login_controller.dart';
import 'package:iloilocityapp/app/modules/moments/moments_controller.dart';
import 'package:iloilocityapp/app/modules/news_events/news_events_controller.dart';
import 'package:iloilocityapp/app/modules/profile/profile_controller.dart';
import 'package:iloilocityapp/app/modules/settings/settings_controller.dart';
import 'package:iloilocityapp/app/modules/sign_up/sign_up_controller.dart';
import 'package:iloilocityapp/app/modules/utilities/my_utilities_controller.dart';

void initControllerModuleDI() {
  getIt
    ..registerSingleton(SignUpController(getIt(), getIt(), getIt()))
    ..registerSingleton(LoginController(getIt(), getIt(), getIt()))
    ..registerSingleton(ProfileController(getIt()))
    ..registerSingleton(SettingsController(getIt()))
    ..registerSingleton(JobsController(getIt(), getIt()))
    ..registerSingleton(EaseOfBusinessController(getIt()))
    ..registerSingleton(CitizenReportController(getIt()))
    ..registerSingleton(DashboardController(getIt()))
    ..registerSingleton(DiscoverController(getIt(), getIt()))
    ..registerSingleton(MyUtilitiesController(getIt()))
    ..registerSingleton(MomentsController(getIt(), getIt()))
    ..registerSingleton(HealthEMRController(getIt(), getIt()))
    ..registerSingleton(NewsAndEventsController(getIt(), getIt()));
}
