import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/utils/date_patterns.dart';
import 'package:iloilocityapp/app/global/utils/app_utils.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_dropdown_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_text_fields.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_image.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/models/citizen_report.dart';
import 'package:iloilocityapp/app/models/job_bulletin.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class CitizenQRCodeView extends StatefulWidget {
  CitizenQRCodeView({Key? key}) : super(key: key);

  @override
  State<CitizenQRCodeView> createState() => _CitizenQRCodeViewState();
}

class _CitizenQRCodeViewState extends State<CitizenQRCodeView> {
  bool _isEmptyQRCode = true;
  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Citizen QR Code',
      subTitle: 'View Citizen QR Code',
      content: _isEmptyQRCode ? _emptyQRCode() : _qrCodeDetails(),
    );
  }

  _activateQRCode() {
    showFilterBottomSheet(context,
        height: 403,
        title: 'Activate My QR Code',
        content: Column(children: [
          SvgPicture.asset(AssetsPath.qrCodeWithAvatarSvg),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Enter the QR Reference Code found below the QR Code of your Citizen ID',
            textAlign: TextAlign.justify,
            style: kTitleTextStyle,
          ),
          const SizedBox(
            height: size10,
          ),
          AppTextField(
            textAlign: TextAlign.center,
            hintText: 'Enter QR Reference Code',
            hintStyle: kHeader3TextStyle.copyWith(color: kGrey),
          ),
          const SizedBox(
            height: size10,
          ),
          AppElevatedButton(
            child: Text(
              'APPLY FILTER',
              style: kHeader3TextStyle.copyWith(color: kWhite),
            ),
            onPressed: () {
              setState(() {
                _isEmptyQRCode = false;
              });
              Navigator.pop(context);
            },
          ),
        ]));
  }

  _qrCodeDetails() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20, vertical: size30),
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(AssetsPath.qrCodeFrameSvg),
                Image.asset(
                  AssetsPath.qrCodeSample,
                  height: 250,
                  width: 250,
                )
              ],
            ),
            const SizedBox(
              height: size30,
            ),
            const AppImage(
              imageUrl:
                  'https://st1.bollywoodlife.com/wp-content/uploads/2022/06/Thor-Love-And-Thunder-God-of-Thunder-Chris-Hemsworth.png',
              height: 56,
              width: 56,
            ),
            const SizedBox(
              height: size10,
            ),
            Text(
              'Juan Dela Cruz',
              style: kHeader2TextStyle.copyWith(color: titleColor),
            ),
            Text(
              '#0001010101',
              style: kHeader3TextStyle.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
      Column(
        children: [
          AppElevatedButton(
            child: Text('View Citizen ID'.toUpperCase(), style: kHeader3TextStyle.copyWith(color: kWhite)),
            onPressed: () => Navigator.pushNamed(context, viewCitizenID),
          ),
          const SizedBox(
            height: size20,
          ),
          AppElevatedButton(
            child: Text('Download QR Code'.toUpperCase(), style: kHeader3TextStyle.copyWith(color: kWhite)),
            onPressed: () {},
          )
        ],
      )
    ]);
  }

  _emptyQRCode() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20, vertical: size30),
        child: Column(
          children: [
            SvgPicture.asset(AssetsPath.qrCodePlaceholderSvg),
            const SizedBox(
              height: size30,
            ),
            Text(
              'No QR Code'.toUpperCase(),
              style: kHeader3TextStyle.copyWith(fontSize: size25, color: kLightGrey),
            ),
            const SizedBox(
              height: size30,
            ),
            const Text(
              'Your QR Code has not yet been activated, activate your QR code by clicking the button below.',
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
      AppElevatedButton(
        child: Text(
          'Activate QR Code'.toUpperCase(),
          style: kHeader3TextStyle.copyWith(color: kWhite),
        ),
        onPressed: () => _activateQRCode(),
      )
    ]);
  }
}
