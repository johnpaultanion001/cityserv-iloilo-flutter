// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class CustomDropDown extends StatelessWidget {
  final String? hintText;
  final String? dropDownValue;
  final dynamic dynamics;
  final dynamic selectedText;
  final List? selectionList;
  const CustomDropDown({
    Key? key,
    this.dropDownValue,
    this.dynamics,
    this.selectedText,
    this.selectionList,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size50 + 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size5),
        color: const Color(0xffF5F5F5),
      ),
      child: DropdownButton<dynamic>(
        dropdownColor: Colors.white,
        underline: const SizedBox.shrink(),
        hint: dropDownValue!.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: size15),
                child: Text(
                  hintText!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: size15, right: size24),
                child: Text(
                  selectedText!.type!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
        isExpanded: true,
        iconEnabledColor: primaryColor,
        icon: const ImageIcon(
          AssetImage(AssetsPath.dropDown),
          size: 35,
        ).paddingOnly(right: size4),
        style: const TextStyle(color: Colors.black),
        items: selectionList!.map((dynamic string) {
          return DropdownMenuItem<dynamic>(
            value: string,
            child: Text(
              string!.type!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          );
        }).toList(),
        onChanged: (dynamic newValue) {
          print("test" + dropDownValue!);
          selectedText.type = newValue!;
          dropDownValue != newValue.type.toString();

          // node.unfocus();
        },
      ),
    );
  }
}
