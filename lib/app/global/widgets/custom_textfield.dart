// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isObscureText;
  final String hintText;
  final TextAlign textAlign;
  final bool? node;
  final ValueChanged? onChange;
  final Widget? suffixIcon;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.isObscureText,
    required this.hintText,
    required this.textAlign,
    this.onChange,
    this.node,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 16),
      controller: widget.textEditingController,
      // onEditingComplete: () => widget.node,
      onSubmitted: (String? value) {
        widget.textEditingController.text = value!;
      },
      onChanged: widget.onChange,
      textAlign: widget.textAlign,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: const Color(0xffF5F5F5),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xff808080),
          fontSize: 16,
        ),
      ),
    );
  }
}
