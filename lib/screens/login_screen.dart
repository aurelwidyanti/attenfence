import 'package:attendance_app/widgets/custom_button.dart';
import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonEnabled = false;

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
      print(
          "NIM: ${_nimController.text}, Password: ${_passwordController.text}");
      print("Button Enabled: $_isButtonEnabled");
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
                      'Welcome Back!',
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
                onChanged: (text) {
                  print("NIM : $text");
                },
              ),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                suffixIcon: Icons.visibility_off,
                controller: _passwordController,
                onChanged: (text) {
                  print("Password : $text");
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: CustomButton(
                  text: 'Login',
                  color: Colors.blue,
                  disabledColor: Colors.blue.shade200,
                  isEnabled: _isButtonEnabled,
                  onPressed: _isButtonEnabled
                      ? () {
                          print("Login button pressed");
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
