import 'package:flutter/material.dart';
import 'package:login_app/src/login_screen.dart';

void main() {
  runApp(
    const LoginApp(),
  );
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      title: 'Login Screen',
      home: LoginScreen(),
    );
  }
}
