import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';

class EmptyResultView extends StatelessWidget {
  const EmptyResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.info_outline,
          color: AppColors.primaryColor,
        ),
        Text(
          'No data available!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
