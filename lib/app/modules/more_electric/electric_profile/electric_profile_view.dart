// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_colors.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/app_electric_styles.dart';
import 'package:iloilocityapp/app/global/constants/more_electric/assets_electric_path.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_separator.dart';
import 'package:iloilocityapp/app/global/widgets/common/more_electric/app_electric_scaffold_with_header.dart';

class ElectricProfileView extends StatefulWidget {
  const ElectricProfileView({Key? key}) : super(key: key);

  @override
  _ElectricProfileViewState createState() => _ElectricProfileViewState();
}

class _ElectricProfileViewState extends State<ElectricProfileView> {
  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    return AppElectricScaffoldWithHeader(
      title: 'My Bills',
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Bill',
                style: kHeader2TextStyle,
              ),
            ),
            SizedBox(
              height: size20,
            ),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(AssetsElectricPath.cardBg),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: size30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('asd'), Text('asd')],
                    ),
                  ),
                  SizedBox(
                    height: size30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('asd'), Text('asd')],
                    ),
                  ),
                  SizedBox(
                    height: size15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('asd'), Text('asd')],
                    ),
                  ),
                  SizedBox(
                    height: size15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('asd'), Text('asd')],
                    ),
                  ),
                  SizedBox(
                    height: size15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppSeparator(color: kWhite),
                  ),
                  SizedBox(
                    height: size15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('asd'), Text('asd')],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size30,
            ),
          ],
        ),
      ),
    );
  }
}
