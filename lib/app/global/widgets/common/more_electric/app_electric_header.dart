// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
// import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_colors.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_styles.dart';
// import 'package:iloilocityapp/app/global/constants/more_electric/assets_electric_path.dart';

class AppElectricHeader extends StatelessWidget {
  final VoidCallback? onPress;
  final String title;
  // final String subTitle;
  final bool showBackArrow;
  const AppElectricHeader({
    Key? key,
    this.onPress,
    required this.title,
    // this.subTitle = '',
    this.showBackArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(size10, size35, size10, size20),
      child: Row(
        children: [
          if (showBackArrow)
            IconButton(
              splashRadius: size20,
              onPressed: onPress,
              icon: const Icon(Icons.arrow_back, size: size33, color: primaryElectricColor),
            ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(size10, 0, 0, 0),
            child: Text(
              title,
              style: kHeader1TextStyle,
            ),
          ),
          // Spacer(),
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child: CircleAvatar(
          //         radius: 24.0,
          //         backgroundImage: AssetImage(
          //           AssetsElectricPath.marty,
          //         ),
          //         backgroundColor: Colors.transparent,
          //         // child: Image.asset(
          //         //   AssetsElectricPath.marty,
          //         //   height: size45,
          //         //   width: size45,
          //         //   fit: BoxFit.fill,
          //         // ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
