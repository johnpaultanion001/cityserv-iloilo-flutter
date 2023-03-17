import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/modules/dashboard/dashboard_controller.dart';

class DashboardCarouselView extends StatefulWidget {
  final DashboardController controller;

  DashboardCarouselView({required this.controller, Key? key}) : super(key: key);

  @override
  State<DashboardCarouselView> createState() => _DashboardCarouselViewState();
}

class _DashboardCarouselViewState extends State<DashboardCarouselView> {
  final carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 2.0,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
          items: widget.controller.imgList
              .map(
                (item) => Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      item.toString(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        _dotIndicators(),
      ],
    ).paddingSymmetric(horizontal: 24);
  }

  Widget _dotIndicators() {
    return Positioned(
      bottom: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.controller.imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carouselController.animateToPage(entry.key),
            child: Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white)
                      .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
