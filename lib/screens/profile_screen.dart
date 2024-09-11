import 'dart:convert';

import 'package:attendance_app/network/api.dart';
import 'package:attendance_app/widgets/custom_app_bar.dart';
import 'package:attendance_app/widgets/custom_profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storage = FlutterSecureStorage();

  Future<void> _logout() async {
    var tokenJson = await storage.read(key: 'token');
    String? token = tokenJson != null ? jsonDecode(tokenJson) : {};
    var response = await Network().post(token, 'logout');

    if (response.statusCode == 200) {
      await storage.deleteAll();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error logging out'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Profile',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),
          const SizedBox(height: 40),
          // Profile Details
          CustomProfileDetail(),
          const SizedBox(height: 40),
          // Logout Button
          ElevatedButton(
            onPressed: _logout,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(226, 66, 66, 1),
              padding: const EdgeInsets.symmetric(
                horizontal: 144,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
