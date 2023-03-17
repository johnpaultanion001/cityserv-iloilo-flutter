import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/data/services/network/citizen_report_service/citizen_report_type_response.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
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
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_controller.dart';
import 'package:image_picker/image_picker.dart';

class CitizenReportCreateView extends StatefulWidget {
  CitizenReportCreateView({Key? key}) : super(key: key);

  @override
  State<CitizenReportCreateView> createState() => _CitizenReportCreateViewState();
}

class _CitizenReportCreateViewState extends State<CitizenReportCreateView> {
  final _controller = getIt<CitizenReportController>();
  final _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller.clearCreateViewState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = appSize(context);
    return AppScaffoldWithHeader(
      title: 'Citizen Report',
      subTitle: 'Manage/Create Incident Report',
      content: Obx(() => _mainContent()),
    );
  }

  Widget _mainContent() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Enter the information in the required fields',
                style: kTitleTextStyle.copyWith(color: primaryColor),
              ),
              Text(
                '*',
                style: kTitleTextStyle.copyWith(color: cancelledColor),
              ),
            ],
          ),
          const SizedBox(
            height: size15,
          ),
          DottedBorder(
              dashPattern: [8, 4],
              strokeWidth: 2,
              radius: const Radius.circular(defaultBorderRadius),
              color: kGrey,
              child: SizedBox(
                height: size150,
                width: MediaQuery.of(context).size.width,
                child: _controller.attachImage['data'] != null ? _imageView() : _emptyImageView(),
              )),
          const SizedBox(
            height: size30,
          ),
          const Text(
            'Report Information',
            style: kHeader2TextStyle,
          ),
          const SizedBox(
            height: size10,
          ),
          AppDropdownButton(
            hasError: _controller.submitTapped.value && _controller.selectedType.value.isEmpty,
            onChanged: (value) => _controller.setType(value),
            items: _getTypeItems(),
            value: _controller.selectedType.value.isEmpty ? null : _controller.selectedType.value,
            hintText: 'Report Type',
            isRequired: true,
          ),
          AppTextField(
            onChanged: (value) => _controller.setTitle(value),
            hintText: 'Report Subject',
            isRequired: true,
          ),
          AppTextField(
            onChanged: (value) => _controller.setContent(value),
            hintText: 'Report Description',
            isRequired: true,
            maxLines: 5,
          ),
          AppElevatedButton(
              verticalMargin: size20,
              child: _controller.isAddingReport.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Submit Report'.toUpperCase(),
                      style: kHeader3TextStyle.copyWith(color: kWhite),
                    ),
              onPressed: () async {
                _controller.setSubmitTap();
                if (_formKey.currentState!.validate()) {
                  await _controller.addCitizenReport();
                }
              })
        ]),
      ),
    );
  }

  Future<void> _pickImage() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 1280,
      imageQuality: 90,
    );

    if (image != null) {
      await _controller.setImage(image);
    }
  }

  Widget _imageView() {
    final xFile = _controller.attachImage['data'] as XFile;
    final file = File(xFile.path);
    return InkWell(
      onTap: _pickImage,
      child: Image.file(
        file,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _emptyImageView() {
    return InkWell(
      onTap: _pickImage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload Report Photo',
            style: kHeader3TextStyle.copyWith(color: kGrey),
          ),
          const SizedBox(
            width: size10,
          ),
          const Icon(
            Icons.photo_camera,
            color: kGrey,
          )
        ],
      ),
    );
  }

  List<String> _getTypeItems() {
    return _controller.reportTypesList.map((e) {
      final type = e as CitizenReportType;
      return type.title;
    }).toList();
  }
}
