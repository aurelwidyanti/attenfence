import 'package:attendance_app/screens/home/geo_presence_screen.dart';
import 'package:attendance_app/screens/home/e_presence_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/widgets/custom_floating_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _homeTab = 'Geo Presence';

  void _onHomeTabChanged(String screen) {
    setState(() {
      _homeTab = screen;
    });
  }

  Widget _buildHomeScreen() {
    if (_homeTab == 'Geo Presence') {
      return const GeoPresenceScreen();
    } else {
      return const EPresenceScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildHomeScreen(),
          CustomFloatingAppBar(
            currentScreen: _homeTab,
            onButtonTapped: _onHomeTabChanged,
          ),
        ],
      ),
    );
  }
}
