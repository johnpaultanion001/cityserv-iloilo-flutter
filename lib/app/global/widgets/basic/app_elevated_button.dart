// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';

class AppElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final double? width;
  final double height;
  final double verticalMargin;
  final bool isLoading;

  const AppElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height = size50,
      this.color = primaryColor,
      this.isLoading = false,
      this.verticalMargin = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: SizedBox(
        height: height,
        width: width ?? appSize(context).width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: .5, primary: color),
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? CircularProgressIndicator(
                    color: AppColors.kWhite,
                    strokeWidth: 2,
                  )
                : child),
      ),
    );
  }
}
