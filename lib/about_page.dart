import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/header_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            HeaderWidget(key: headerKey),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF4d2963)),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    },
                    tooltip: 'Go back',
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                  ),
                  const Text(
                    'About Union Shop',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your trusted campus store for official university merchandise and essentials.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),

                  // Our Story section
                  Text(
                    'Our Story',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Founded in 2010, Union Shop has been serving students with quality university merchandise and daily essentials.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),

                  // Contact section
                  SizedBox(height: 24),
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: support@unionshop.com\nPhone: +44 123 456 7890\nLocation: Student Union Building, Campus',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  // Footer
                  FooterWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}