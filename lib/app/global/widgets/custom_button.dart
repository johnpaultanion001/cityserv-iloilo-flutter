// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPresssed;
  final Color color;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPresssed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: onPresssed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
