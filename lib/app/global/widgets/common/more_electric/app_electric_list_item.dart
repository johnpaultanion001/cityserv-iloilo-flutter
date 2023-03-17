// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class AppListItem extends StatefulWidget {
  final String imageString;
  final String titleString;
  final String dateString;
  final String statusString;
  final Color statColor;
  const AppListItem({
    Key? key,
    required this.imageString,
    required this.titleString,
    required this.dateString,
    required this.statusString,
    required this.statColor,
  }) : super(key: key);

  @override
  _AppListItemState createState() => _AppListItemState();
}

class _AppListItemState extends State<AppListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size70 + size2,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.imageString.toString(),
                height: size80,
                width: size80,
                fit: BoxFit.contain,
              ),
              SizedBox(width: size12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.titleString.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ).paddingOnly(bottom: size4),
                  Text(
                    widget.dateString.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ).paddingOnly(bottom: size4),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Status:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  ${widget.statusString.toString()}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: widget.statColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: size45,
            width: size45,
            decoration: BoxDecoration(
              color: lightBackgroundColor,
              borderRadius: BorderRadius.circular(size5),
            ),
            child: Image.asset(
              AssetsPath.arrowBlue,
            ),
          ),
        ],
      ),
    );
  }
}
