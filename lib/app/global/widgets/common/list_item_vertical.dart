import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';

class ListItemVertical extends StatelessWidget {
  final VoidCallback? onPress;
  final String title;
  final double horizontalMargin;
  final double verticalPadding;

  const ListItemVertical({Key? key, this.onPress, this.title = '', this.horizontalMargin = 0, this.verticalPadding = size15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: size16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: size16, vertical: size8), elevation: .5, primary: customButtonBackground),
        onPressed: onPress,
        child: Text(
          title,
          style: kHeader3TextStyle.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
