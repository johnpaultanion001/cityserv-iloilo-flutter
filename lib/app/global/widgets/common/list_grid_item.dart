import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image_with_bg.dart';

class ListGridItem extends StatelessWidget {
  final VoidCallback? onPress;
  final String title;
  final String imageUrl;
  final String description;
  final String? status;
  final double horizontalMargin;
  final double verticalPadding;
  const ListGridItem(
      {Key? key,
      this.onPress,
      this.imageUrl = '',
      this.title = '',
      this.description = '',
      this.status,
      this.horizontalMargin = 0,
      this.verticalPadding = size15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageWithBg(
              imgheight: size100 + size60,
              imgwidth: size100 + size70,
              imageUrl: imageUrl,
            ),
            const SizedBox(
              height: size10,
            ),
            Text(
              title,
              style: kHeader3TextStyle.copyWith(color: primaryColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: size10,
            ),
            Text(
              description,
              style: kSubTitleTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
