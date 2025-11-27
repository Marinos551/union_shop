import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // State variables
  bool _isLoginMode = true;
  bool _obscurePassword = true;
  
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo
              const Icon(
                Icons.shopping_bag,
                size: 80,
                color: Color(0xFF4d2963),
              ),
              const SizedBox(height: 24),
              // Welcome text
              const Text(
                'Welcome to Union Shop',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                _isLoginMode ? 'Login to your account' : 'Create a new account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              // Form will go here
              const Text('Form fields coming next...'),
            ],
          ),
        ),
      ),
    );
  }
}