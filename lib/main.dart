import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloilocityapp/app/app.dart';
import 'package:iloilocityapp/app/data/services/storage_service.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: statusBarColor));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  //Lock device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync<StorageService>(() async => StorageService());
  initializeDIModules();
  runApp(const MyApp());
}
