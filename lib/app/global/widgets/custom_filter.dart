import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';

class CustomFilter extends StatelessWidget {
  final String textString;
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomFilter({Key? key, required this.textString, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textString,
          style: kHeader3TextStyle.copyWith(color: primaryColor),
        ),
        SizedBox(
          height: size32,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0), elevation: .5, primary: customButtonBackground),
              onPressed: onPressed,
              child: Text(
                'View All',
                style: kSubTitleTextStyle.copyWith(color: filterColor),
              )),
        ),
      ],
    );
  }
}
