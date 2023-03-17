import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/widgets/common/more_electric/app_electric_header.dart';
// import 'package:iloilocityapp/app/global/configs/colors.dart';
// import 'package:iloilocityapp/app/global/widgets/common/app_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/more_electric/app_electric_scaffold.dart';

class AppElectricScaffoldWithHeader extends StatelessWidget {
  final Widget content;
  final String title;
  // final String subTitle;
  final bool showBackArrow;
  const AppElectricScaffoldWithHeader(
      {Key? key,
      required this.content,
      required this.title,
      // this.subTitle = '',
      this.showBackArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppElectricScaffold(
      body: Column(children: [
        AppElectricHeader(
          onPress: showBackArrow ? () => Navigator.pop(context) : null,
          title: title,
          // subTitle: subTitle,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: pagePadding, vertical: size10),
          child: content,
        )),
      ]),
    );
  }
}
