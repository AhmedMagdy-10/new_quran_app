import 'package:flutter/material.dart';
import 'package:quran_app/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.sendOnPressed,
      this.hintText,
      this.controller,
      this.onChanged});

  final void Function()? sendOnPressed;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 17,
        fontFamily: 'Cairo',
      ),
      controller: controller,
      cursorWidth: 0,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(8),
        fillColor: secondColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: threeColor,
          fontSize: 14,
          fontFamily: 'Cairo',
        ),
        suffixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: secondColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: secondColor,
          ),
        ),
      ),
    );
  }
}
