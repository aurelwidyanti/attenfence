import 'package:attendance_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> scheduleData = [
      {
        'course': 'Object Oriented Programming',
        'time': 'Monday, 9:00 AM - 11:00 AM',
        'location': 'Room 101',
      },
      {
        'course': 'Software Engineering',
        'time': 'Tuesday, 1:00 PM - 3:00 PM',
        'location': 'Room 202',
      },
      {
        'course': 'Database Systems',
        'time': 'Wednesday, 10:00 AM - 12:00 PM',
        'location': 'Room 303',
      },
      {
        'course': 'Mobile App Development',
        'time': 'Thursday, 2:00 PM - 4:00 PM',
        'location': 'Room 404',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          width: 32,
          title: 'Schedule',
          titleAlignment: Alignment.topLeft,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monday',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleData.length,
                itemBuilder: (context, index) {
                  final schedule = scheduleData[index];
                  return Card(
                    color: Colors.blue[50],
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        schedule['course']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(60, 75, 206, 1),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schedule['time']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            schedule['location']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(60, 75, 206, 1),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
