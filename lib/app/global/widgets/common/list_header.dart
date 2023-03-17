import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';

class ListHeader extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool showFilter;
  final double horizontalPadding;
  const ListHeader(
      {Key? key,
      this.onPressed,
      this.title = '',
      this.showFilter = true,
      this.horizontalPadding = size20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kHeader3TextStyle.copyWith(color: primaryColor),
          ),
          if (showFilter)
            SizedBox(
              height: size32,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      elevation: .5,
                      primary: customButtonBackground),
                  onPressed: onPressed,
                  child: Text(
                    'Filter',
                    style: kSubTitleTextStyle.copyWith(color: filterColor),
                  )),
            )
        ],
      ),
    );
  }
}
