import 'package:attendance_app/screens/history_screen.dart';
import 'package:attendance_app/screens/home_screen.dart';
import 'package:attendance_app/screens/login_screen.dart';
import 'package:attendance_app/screens/profile_screen.dart';
import 'package:attendance_app/screens/splash_screen.dart';
import 'package:attendance_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: 'Attendance',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const LoginScreen(),
    routes: {
      '/splash': (context) => const SplashScreen(),
      '/home': (context) => const MainLayout(initialIndex: 0),
      '/history': (context) => const MainLayout(initialIndex: 1),
      '/profile': (context) => const MainLayout(initialIndex: 2),
      '/login': (context) => const LoginScreen(),
    },
  ));
}

class MainLayout extends StatefulWidget {
  final int initialIndex;

  const MainLayout({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _selectedIndex;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  void _onScreenChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          HistoryScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onScreenChanged: _onScreenChanged,
      ),
    );
  }
}
