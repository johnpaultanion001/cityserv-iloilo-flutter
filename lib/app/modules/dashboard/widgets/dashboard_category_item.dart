import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/constants/app_colors.dart';

class DashboardCategoryItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String title;
  const DashboardCategoryItem({
    required this.onTap,
    required this.imagePath,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFFEBF9FF),
            ),
            child: Image.asset(
              imagePath,
              height: 32,
              width: 32,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: primaryColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
