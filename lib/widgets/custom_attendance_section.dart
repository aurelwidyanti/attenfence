import 'package:attendance_app/widgets/custom_attendance_item.dart';
import 'package:flutter/material.dart';

class CustomAttendanceSection extends StatelessWidget {
  final String date;
  final List<CustomAttendanceItem> attendances;

  const CustomAttendanceSection({
    super.key,
    required this.date,
    required this.attendances,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          width: double.infinity,
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
        Column(
          children: attendances,
        ),
      ],
    );
  }
}
