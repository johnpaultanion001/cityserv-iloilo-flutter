// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iloilocityapp/app/global/configs/colors.dart';

class CustomFilterButton extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  const CustomFilterButton({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);

  @override
  _CustomFilterButtonState createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: () => widget.onPressed,
        child: Text(
          widget.buttonText,
          style: TextStyle(
            fontSize: 12,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
