import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
// import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_header.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold.dart';

class AppScaffoldWithHeader extends StatelessWidget {
  final Widget content;
  final String title;
  final String subTitle;
  final bool showBackArrow;
  const AppScaffoldWithHeader(
      {Key? key,
      required this.content,
      required this.title,
      this.subTitle = '',
      this.showBackArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(children: [
        AppHeader(
          onPress: showBackArrow ? () => Navigator.pop(context) : null,
          title: title,
          subTitle: subTitle,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(
              pagePadding, size10, pagePadding, pagePadding),
          child: content,
        )),
      ]),
    );
  }
}
