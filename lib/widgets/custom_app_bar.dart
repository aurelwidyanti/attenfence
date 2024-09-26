import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double width;
  final Alignment titleAlignment;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.width,
    this.titleAlignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.25),
        surfaceTintColor: Colors.transparent,
        title: Align(
          alignment: titleAlignment,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
