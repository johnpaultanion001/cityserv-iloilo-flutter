import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomsheet;

  const AppScaffold({Key? key, this.body, this.bottomsheet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsPath.mainBg), fit: BoxFit.fill)),
        child: body,
      ),
      bottomSheet: bottomsheet,
    );
  }
}
