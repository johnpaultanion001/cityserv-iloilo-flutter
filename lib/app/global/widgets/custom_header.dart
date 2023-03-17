// ignore_for_file: avoid_print, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class CustomHeader extends StatefulWidget {
  final bool isBackVisible;
  final String headerText;
  final String mainText;
  final bool isLogoVisible;
  final bool isDashBorad;
  final double mainTextSize;
  const CustomHeader({
    Key? key,
    required this.isBackVisible,
    required this.headerText,
    required this.mainText,
    required this.isLogoVisible,
    required this.isDashBorad,
    this.mainTextSize = 15,
  }) : super(key: key);

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 8),
      child: SizedBox(
        height: 72,
        width: double.infinity,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.isBackVisible == true
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: primaryColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox.shrink(),
                      ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.headerText,
                      style: kHeader1TextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: size10,
                    ),
                    Text(
                      widget.mainText,
                      overflow: TextOverflow.fade,
                      style: kHeader3TextStyle.copyWith(fontSize: widget.mainTextSize),
                    ),
                  ],
                ),
              ],
            ),
            widget.isLogoVisible == true
                ? Image.asset(
                    AssetsPath.iloiloSeal,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
