import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback? onPress;
  final String title;
  final String subTitle;
  final bool showBackArrow;
  const AppHeader(
      {Key? key,
      this.onPress,
      required this.title,
      this.subTitle = '',
      this.showBackArrow = true})
      : super(key: key);

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
              icon: const Icon(Icons.arrow_back,
                  size: size33, color: primaryColor),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(size10, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kHeader1TextStyle,
                ),
                const SizedBox(
                  height: size10,
                ),
                Text(
                  subTitle,
                  style: kHeader3TextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
