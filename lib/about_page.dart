import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('About Us Page - Content coming soon'),
      ),
    );
  }
}