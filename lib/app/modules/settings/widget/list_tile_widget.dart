// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class ListTileWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final VoidCallback? onPressed;
  final Color? titleColor;
  const ListTileWidget({
    Key? key,
    this.image,
    this.title,
    this.titleColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: size8, vertical: size4),
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          height: size50 + size5,
          width: size50 + size5,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: ExactAssetImage(AssetsPath.decorationImage),
              fit: BoxFit.cover,
            ),
            // color: statusBarColor,
          ),
          child: Center(
            child: Image.asset(
              image.toString(),
              height: size30,
              width: size30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          title!,
          style: kTitleTextStyle.copyWith(color: titleColor ?? primaryColor),
        ),
      ),
    );
  }
}
