import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';
import 'package:iloilocityapp/app/global/constants/app_dimens.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/constants/app_styles.dart';
import 'package:intl/intl.dart';

Size appSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Color getStatusColor(String status) {
  switch (status) {
    case 'pending':
      return pendingColor;
    case 'cancelled':
      return cancelledColor;
    default:
      return resolvedColor;
  }
}

showFilterBottomSheet(BuildContext context, {required String title, required Widget content, double height = 291}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(size15), topRight: Radius.circular(size15))),
      context: context,
      builder: (context) {
        return Container(
          height: height,
          padding: const EdgeInsets.symmetric(vertical: size15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(size20, 0, size5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: kHeader2TextStyle,
                    ),
                    IconButton(
                        iconSize: size30,
                        splashRadius: size20,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: kGrey,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: size20,
                ),
                child: content,
              ),
            ],
          ),
        );
      });
}

void showSnackBar(String title, String message, {snackPosition = SnackPosition.BOTTOM, bool error = false}) {
  Get.snackbar(title, message,
      snackPosition: snackPosition,
      backgroundColor: AppColors.kWhite,
      icon: error
          ? const Icon(
              Icons.error_outline_sharp,
              color: Colors.red,
            )
          : const Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
}

void handleError({String title = 'Failed', required String message}) {
  showSnackBar(title, message, error: true);
}
