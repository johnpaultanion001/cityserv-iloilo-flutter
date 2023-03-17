// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class AppImageWithBg extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double imgheight;
  final double imgwidth;
  const AppImageWithBg({
    Key? key,
    required this.imageUrl,
    this.height = listImageSize,
    this.width = listImageSize,
    required this.imgheight,
    required this.imgwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: size16,
          left: size16,
          right: size16,
          top: size16,
          child: Image.network(
            imageUrl,
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: imgheight,
          width: imgwidth,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AssetsPath.momentBg),
            fit: BoxFit.fill,
          )),
        ),
      ],
    );
  }
}
