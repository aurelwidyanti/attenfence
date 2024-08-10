import 'package:attendance_app/screens/home/geo_presence_screen.dart';
import 'package:attendance_app/widgets/custom_floating_app_bar.dart';
import 'package:attendance_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void _navigateToEPresence() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => EPresencePage()))
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Stack(
        children: [
          CustomFloatingAppBar(),
          GeoPresenceScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
