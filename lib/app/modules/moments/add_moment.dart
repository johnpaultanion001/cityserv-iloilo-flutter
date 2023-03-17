// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_elevated_button.dart';
import 'package:iloilocityapp/app/global/widgets/basic/app_text_fields.dart';
import 'package:iloilocityapp/app/global/widgets/common/app_scaffold_with_header.dart';
import 'package:iloilocityapp/app/global/widgets/custom_textfield.dart';
import 'package:iloilocityapp/app/modules/moments/moments_controller.dart';
import 'package:image_picker/image_picker.dart';

class AddMomentView extends StatefulWidget {
  const AddMomentView({Key? key}) : super(key: key);

  @override
  _AddMomentViewState createState() => _AddMomentViewState();
}

class _AddMomentViewState extends State<AddMomentView> {
  final firstNameTextController = TextEditingController();
  final _controller = getIt<MomentsController>();
  final _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithHeader(
        title: 'Create New Moment',
        subTitle: 'Add a New Moment',
        content: Obx(() => Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: size16,
                        left: size16,
                        right: size16,
                        top: size16,
                        child: _controller.attachImage['data'] != null ? _imageView() : _emptyImageView(),
                      ),
                      InkWell(
                        onTap: () => _pickImage(),
                        child: Container(
                          height: size300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(AssetsPath.momentBg),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: size30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Moment Title',
                      style: kHeader2TextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: size24,
                  ),
                  AppTextField(
                    controller: firstNameTextController,
                    hintText: 'Enter Moment Title',
                    isRequired: true,
                    onChanged: (value) => _controller.setMomentTitle(value),
                  ),
                  Spacer(),
                  AppElevatedButton(
                      isLoading: _controller.isCreatingMoment.value,
                      color: primaryColor,
                      child: Text(
                        'Create Moment'.toUpperCase(),
                        style: kHeader3TextStyle.copyWith(color: kWhite),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _controller.createMoment();
                        }
                      })
                ],
              ),
            )));
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
    return Image.file(
      file,
      fit: BoxFit.cover,
    );
  }

  Widget _emptyImageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size50,
          width: size70,
          child: Image.asset(
            AssetsPath.camera,
            height: size70,
            width: size90,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: size16,
        ),
        Text(
          'Tap to Take \n Photo',
          textAlign: TextAlign.center,
          style: kHeader3TextStyle,
        ),
      ],
    );
  }
}
