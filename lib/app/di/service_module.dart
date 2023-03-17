import 'package:iloilocityapp/app/data/services/network/articles/article_api.dart';
import 'package:iloilocityapp/app/data/services/network/articles/article_service.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/auth_api.dart';
import 'package:iloilocityapp/app/data/services/network/auth_service/auth_service.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_api.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_service.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_api.dart';
import 'package:iloilocityapp/app/data/services/network/discover_service/discover_service.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/ease_of_business_service.dart';
import 'package:iloilocityapp/app/data/services/network/ease_of_business/ease_of_business_api.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/jobs_api.dart';
import 'package:iloilocityapp/app/data/services/network/jobs_services/jobs_service.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/moments_api.dart';
import 'package:iloilocityapp/app/data/services/network/moments_service/moments_service.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_api.dart';
import 'package:iloilocityapp/app/data/services/network/profile/profile_service.dart';
import 'package:iloilocityapp/app/di/main_di.dart';

void initServiceModuleDI() {
  getIt
    ..registerSingleton<AuthAPI>(AuthService(getIt()))
    ..registerSingleton<ProfileService>(ProfileApi(getIt()))
    ..registerSingleton<JobsAPI>(JobsService(getIt()))
    ..registerSingleton<EaseOfBusinessService>(EaseOfBusinessApi(getIt()))
    ..registerSingleton<CitizenReportService>(CitizenReportAPI(getIt()))
    ..registerSingleton<DiscoverService>(DiscoverApi(getIt()))
    ..registerSingleton<MomentsService>(MomentsApi(getIt()))
    ..registerSingleton<ArticleService>(ArticleApi(getIt()));
}
