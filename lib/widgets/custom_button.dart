import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color disabledColor;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final Color disabledTextColor;
  final Color enabledTextColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.disabledColor,
    required this.isEnabled,
    required this.enabledTextColor,
    required this.disabledTextColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return disabledColor;
              }
              return color;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return disabledTextColor;
              }
              return enabledTextColor;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: isEnabled ? enabledTextColor : disabledTextColor),
        ),
      ),
    );
  }
}
