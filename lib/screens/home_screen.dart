import 'package:attendance_app/screens/home/geo_presence_screen.dart';
import 'package:attendance_app/screens/profile_screen.dart';
import 'package:attendance_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const GeoPresenceScreen(),
    const Center(child: Text('History Screen')),
    const ProfileScreen(),
  ];

  void _onScreenChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onScreenChanged: _onScreenChanged,
      ),
    );
  }
}
