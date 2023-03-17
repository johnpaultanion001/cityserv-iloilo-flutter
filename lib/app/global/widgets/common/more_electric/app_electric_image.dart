import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';

class AppElectricImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const AppElectricImage({
    Key? key,
    required this.imageUrl,
    this.height = listImageSize,
    this.width = listImageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size4),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
