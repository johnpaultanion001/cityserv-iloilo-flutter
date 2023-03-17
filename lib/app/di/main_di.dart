import 'package:get_it/get_it.dart';
import 'package:iloilocityapp/app/di/controller_module.dart';
import 'package:iloilocityapp/app/di/core_module.dart';
import 'package:iloilocityapp/app/di/repository_module.dart';
import 'package:iloilocityapp/app/di/service_module.dart';

final getIt = GetIt.instance;

void initializeDIModules() {
  initCoreModuleDI();
  initServiceModuleDI();
  initRepositoriesDI();
  initControllerModuleDI();
}
