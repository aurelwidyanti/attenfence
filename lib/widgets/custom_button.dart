import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color disabledColor;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.disabledColor,
    required this.isEnabled,
    this.onPressed,
    this.textColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? color : disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
