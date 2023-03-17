// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_colors.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/assets_electric_path.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class SplashScreenElectricView extends StatefulWidget {
  const SplashScreenElectricView({Key? key}) : super(key: key);

  @override
  _SplashScreenElectricViewState createState() => _SplashScreenElectricViewState();
}

class _SplashScreenElectricViewState extends State<SplashScreenElectricView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(electricbottomnav);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryElectricColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsElectricPath.moreElectricBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  height: size100 + size60,
                  width: size200,
                  child: Image.asset(
                    AssetsElectricPath.moreElectricLogo,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
