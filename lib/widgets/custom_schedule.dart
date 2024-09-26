import 'dart:convert';
import 'package:attendance_app/network/api.dart';
import 'package:attendance_app/widgets/custom_table.dart';
import 'package:flutter/material.dart';

class CustomSchedule extends StatelessWidget {
  final network = Network();
  CustomSchedule({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> _getScheduleData() async {
    var response = await network.get('schedule');
    var data = jsonDecode(response.body)['data'];

    return {
      'course_id': data['course_id'],
      'day': data['day'],
      'start_time': data['start_time'],
      'end_time': data['end_time'],
      'room': data['room'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _getScheduleData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading schedule data'));
        }

        var scheduleData = snapshot.data ??
            {
              'course_id': 'Unknown',
              'day': 'Unknown',
              'start_time': 'Unknown',
              'end_time': 'Unknown',
              'room': 'Unknown',
            };

        return CustomTable(rows: [
          TableRow(
            children: [
              ScheduleRow(
                  label: 'Course ID',
                  value: scheduleData['course_id'].toString()),
            ],
          ),
          TableRow(
            children: [
              ScheduleRow(
                  label: 'Day', value: scheduleData['day'] ?? 'Unknown'),
            ],
          ),
          TableRow(
            children: [
              ScheduleRow(
                  label: 'Start Time',
                  value: scheduleData['start_time'] ?? 'Unknown'),
            ],
          ),
          TableRow(
            children: [
              ScheduleRow(
                  label: 'End Time',
                  value: scheduleData['end_time'] ?? 'Unknown'),
            ],
          ),
          TableRow(
            children: [
              ScheduleRow(
                  label: 'Room', value: scheduleData['room'] ?? 'Unknown'),
            ],
          ),
        ]);
      },
    );
  }
}

class ScheduleRow extends StatelessWidget {
  final String label;
  final String value;

  const ScheduleRow({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              '$label ',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // const SizedBox(width: 3),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
