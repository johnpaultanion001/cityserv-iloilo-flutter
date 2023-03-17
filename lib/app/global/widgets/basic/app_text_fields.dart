import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';

class AppTextField extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isObscureText;
  final String label;
  final double width;
  final bool enabled;
  final TextStyle style;
  final TextStyle? hintStyle;
  final int maxLines;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final bool isRequired;
  const AppTextField({
    Key? key,
    this.label = '',
    this.verticalMargin = size15,
    this.horizontalMargin = 0,
    this.verticalPadding = size10,
    this.horizontalPadding = size25,
    this.controller,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText = '',
    this.enabled = true,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.style = kHeader3TextStyle,
    this.hintStyle = kHeader3TextStyle,
    this.width = double.infinity,
    this.onChanged,
    this.isObscureText = false,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
      child: TextFormField(
        validator: !isRequired
            ? null
            : (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                return null;
              },
        onChanged: onChanged,
        style: style,
        textAlign: textAlign,
        enabled: enabled,
        controller: controller,
        obscureText: isObscureText,
        cursorColor: kGrey,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: inputBackground,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          enabled: enabled,
          contentPadding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: inputBackground),
              borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: inputBackground),
              borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: inputBackground),
              borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))),
          hintText: hintText,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
