import 'dart:convert';

import 'package:attendance_app/network/api.dart';
import 'package:attendance_app/widgets/custom_button.dart';
import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final storage = FlutterSecureStorage();

  bool _isButtonEnabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nimController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      _isButtonEnabled =
          _nimController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  void _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = false;
    });

    String nim = _nimController.text;
    String password = _passwordController.text;

    var data = {
      'nim': nim,
      'password': password,
    };

    var response = await Network().post(data, 'login');
    print(response);
    var body = jsonDecode(response.body ?? '{}');
    print(body);

    if (response.statusCode == 200 && body['data']['token'] != null) {
      final Map<String, dynamic> responseData = body['data'];
      // Store token, nim, name, email in secure storage
      await storage.write(
          key: 'token', value: jsonEncode(responseData['token']));
      await storage.write(key: 'nim', value: responseData['nim']);
      await storage.write(key: 'name', value: responseData['name']);
      await storage.write(key: 'email', value: responseData['email']);

      Navigator.pushReplacementNamed(context, '/splash');
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nimController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.32),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'NIM',
                controller: _nimController,
              ),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                suffixIcon: Icons.visibility_off,
                controller: _passwordController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: 'Login',
                        color: const Color.fromRGBO(60, 75, 206, 1),
                        disabledColor: const Color.fromRGBO(60, 75, 206, 0.50),
                        enabledTextColor: Colors.white,
                        disabledTextColor:
                            const Color.fromRGBO(255, 255, 255, 0.75),
                        isEnabled: _isButtonEnabled,
                        onPressed: _isButtonEnabled ? _login : null,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
