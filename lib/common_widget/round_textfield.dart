import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const RoundTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: TColor.fieldtext,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: TColor.placeholder),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
