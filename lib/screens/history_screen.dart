import 'package:attendance_app/widgets/custom_app_bar.dart';
import 'package:attendance_app/widgets/custom_attendance_item.dart';
import 'package:attendance_app/widgets/custom_attendance_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Attendance Report',
        ),
      ),
      body: ListView(
        children: const [
          CustomAttendanceSection(
            date: '2 April 2024',
            attendances: [
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
            ],
          ),
          CustomAttendanceSection(
            date: '1 April 2024',
            attendances: [
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Absent',
                statusColor: Color.fromRGBO(187, 33, 36, 1),
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
              CustomAttendanceItem(
                subject: 'Interaksi Manusia dan Komputer',
                location: 'H.5.9',
                time: '09:31:29 (Auto Recorded)',
                status: 'Present',
                statusColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
