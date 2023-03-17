import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';

class ListItem extends StatelessWidget {
  final VoidCallback? onPress;
  final String title;
  final String imageUrl;
  final String description;
  final String? status;
  final double horizontalMargin;
  final double verticalPadding;
  final bool isAsset;
  const ListItem(
      {Key? key,
      this.onPress,
      this.imageUrl = '',
      this.title = '',
      this.description = '',
      this.status,
      this.horizontalMargin = 0,
      this.isAsset = false,
      this.verticalPadding = size15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: dividerColor))),
      child: Row(children: [
        AppImage(
          imageUrl: imageUrl,
          isAsset: isAsset,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          width: size15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(
                height: size5,
              ),
              if (status != null && status != '')
                Row(
                  children: [
                    const Text(
                      'Status:',
                      style: kSubTitleTextStyle,
                    ),
                    const SizedBox(
                      width: size5,
                    ),
                    Text(status!, style: kSubTitleTextStyle.copyWith(color: getStatusColor(status!.toLowerCase()))),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(
          width: size10,
        ),
        SizedBox(
          width: size34,
          height: size34,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0), elevation: .5, primary: customButtonBackground),
              onPressed: onPress,
              child: const Icon(
                Icons.arrow_forward,
                color: primaryColor,
              )),
        ),
      ]),
    );
  }
}
