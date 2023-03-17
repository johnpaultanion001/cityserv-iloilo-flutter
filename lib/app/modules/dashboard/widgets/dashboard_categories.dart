import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_controller.dart';
import 'package:iloilocityapp/app/modules/dashboard/widgets/dashboard_category_item.dart';

class DashboardCategories extends StatelessWidget {
  final DashboardController controller;
  const DashboardCategories({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.9,
          mainAxisSpacing: 8,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return DashboardCategoryItem(
            title: category.title,
            imagePath: category.image,
            onTap: () => controller.navigateToPage(category.route),
          );
        },
      ),
    );
  }
}
