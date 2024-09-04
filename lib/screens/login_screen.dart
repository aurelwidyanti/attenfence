import 'package:attendance_app/widgets/custom_button.dart';
import 'package:attendance_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    String nim = _nimController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nim,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/splash');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed login")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
