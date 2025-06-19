import 'package:demo/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.icon,
    this.hintText,
    this.editingController,
    this.isPassword = false
  });
  final Icon? icon;
  final String? hintText;
  final TextEditingController? editingController;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: editingController,
      cursorColor: ColorPalette.primary,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: ColorPalette.primary),
        ),
      ),
    );
  }
}
