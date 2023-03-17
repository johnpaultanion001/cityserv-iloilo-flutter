// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';
import 'package:iloilocityapp/app/global/constants/assets_path.dart';

class CustomBackground extends StatefulWidget {
  final Widget child;
  const CustomBackground({Key? key, required this.child}) : super(key: key);

  @override
  _CustomBackgroundState createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: statusBarColor,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsPath.bgMain),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
