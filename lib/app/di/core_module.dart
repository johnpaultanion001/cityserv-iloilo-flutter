import 'package:iloilocityapp/app/data/services/network/config/network_provider.dart';
import 'package:iloilocityapp/app/data/storage/auth_data.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';

import '../data/storage/local_storage_provider.dart';

void initCoreModuleDI() {
  getIt
    ..registerSingleton(NetworkProvider())
    ..registerSingleton(LocalStorageProvider())
    ..registerSingleton(AuthData(getIt()))
    ..registerSingleton(AppNavigation(getIt()));
}
