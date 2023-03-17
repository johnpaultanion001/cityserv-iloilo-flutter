// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class CustomListItem extends StatefulWidget {
  final String imageString;
  final String titleString;
  final String dateString;
  final String statusString;
  final Color statColor;
  const CustomListItem({
    Key? key,
    required this.imageString,
    required this.titleString,
    required this.dateString,
    required this.statusString,
    required this.statColor,
  }) : super(key: key);

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(
                  widget.imageString,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.titleString.toString(),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ).paddingOnly(bottom: 4),
                    Text(
                      widget.dateString.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ).paddingOnly(bottom: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: widget.statusString.toString(),
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
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: customButtonBackground,
              borderRadius: BorderRadius.circular(5),
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
