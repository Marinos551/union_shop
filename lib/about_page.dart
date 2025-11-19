import 'package:flutter/material.dart';
import 'package:union_shop/footer_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Union Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your trusted campus store for official university merchandise and essentials.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Our Story section
            const Text(
              'Our Story',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Founded in 2010, Union Shop has been serving students with quality university merchandise and daily essentials.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Contact section
            const SizedBox(height: 24),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: support@unionshop.com\nPhone: +44 123 456 7890\nLocation: Student Union Building, Campus',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

// Added FooterWidget to centralize footer UI
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.grey[50],
      child: const Text(
        '© 2025 Union Shop. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}