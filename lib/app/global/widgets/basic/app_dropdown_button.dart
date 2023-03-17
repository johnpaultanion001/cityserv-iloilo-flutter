import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class AppDropdownButton extends StatelessWidget {
  final String? value;
  final ValueChanged? onChanged;
  final List<String> items;
  final String hintText;
  final double horizontalPadding;
  final double verticalPadding;
  final double verticalMargin;
  final Widget? prefixIcon;
  final bool isRequired;
  final bool hasError;
  const AppDropdownButton(
      {Key? key,
      this.value,
      this.onChanged,
      required this.items,
      this.hintText = '',
      this.verticalPadding = 0,
      this.verticalMargin = size10,
      this.prefixIcon,
      this.isRequired = false,
      this.hasError = false,
      this.horizontalPadding = size25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
          color: inputBackground,
          border: Border.all(color: hasError ? AppColors.kRed : inputBackground),
          borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius))),
      child: Row(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hintText, style: kHeader3TextStyle.copyWith(fontWeight: FontWeight.w600)),
              borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
              value: value,
              icon: SvgPicture.asset(AssetsPath.dropdownSvg),
              elevation: 16,
              underline: const SizedBox.shrink(),
              style: const TextStyle(color: kBlack),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: kHeader3TextStyle,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
