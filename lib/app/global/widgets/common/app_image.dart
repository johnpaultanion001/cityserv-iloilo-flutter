import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final bool isAsset;
  final BoxFit fit;
  const AppImage(
      {Key? key,
      required this.imageUrl,
      this.height = listImageSize,
      this.isAsset = false,
      this.fit = BoxFit.fill,
      this.width = listImageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size4),
      child: isAsset
          ? Image.asset(
              imageUrl,
              height: height,
              width: width,
              fit: fit,
            )
          : Image.network(
              imageUrl,
              height: height,
              width: width,
              fit: fit,
              errorBuilder: ((context, error, stackTrace) {
                return Image.asset(
                  AssetsPath.splashLogo,
                  height: height,
                  width: width,
                  fit: fit,
                );
              }),
            ),
    );
  }
}
