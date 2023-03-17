import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';
import 'package:iloilocityapp/app/routes/route_pages.dart';
import 'package:iloilocityapp/app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      title: 'Brgy. Salinas 1',
      initialRoute: splashscreen,
      getPages: AppPages.pages,
      locale: const Locale('en', 'US'),
    );
  }
}
