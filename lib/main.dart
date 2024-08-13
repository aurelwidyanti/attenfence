import 'package:attendance_app/screens/home_screen.dart';
import 'package:attendance_app/screens/login_screen.dart';
import 'package:attendance_app/screens/profile_screen.dart';
import 'package:attendance_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'attenfence',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomeScreen(),
    routes: {
      '/home': (context) => const HomeScreen(),
      '/login': (context) => const LoginScreen(),
    },
  ));
}
