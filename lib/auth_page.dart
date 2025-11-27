import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('Authentication Page - Under Construction'),
      ),
    );
  }
}