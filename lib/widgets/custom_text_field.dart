import 'package:flutter/material.dart';

// CustomTextField widget
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: obscureText,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
                border: InputBorder.none,
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: Colors.grey.shade500)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
