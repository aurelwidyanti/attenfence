import 'package:attendance_app/screens/home/e_presence_screen.dart';
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
  Widget _currentScreen = const GeoPresenceScreen();
  String _currentScreenName = 'Geo Presence';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateScreen(String screenName) {
    setState(() {
      _currentScreenName = screenName;
      if (screenName == 'Geo Presence') {
        _currentScreen = const GeoPresenceScreen();
      } else if (screenName == 'E-Presence') {
        _currentScreen = const EPresenceScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _currentScreen,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomFloatingAppBar(
              onButtonTapped: _updateScreen,
              currentScreen: _currentScreenName,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
