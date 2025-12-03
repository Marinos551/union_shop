import 'package:flutter/material.dart';
import 'package:union_shop/views/common_page_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CommonPageScaffold(
      padding: EdgeInsets.zero,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // Content
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(16),
          // ignore: prefer_const_constructors
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'About Union Shop',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 16),
              // ignore: prefer_const_constructors
              Text(
                'Your trusted campus store for official university merchandise and essentials.',
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 16),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 24),

              // Our Story section
              // ignore: prefer_const_constructors
              Text(
                'Our Story',
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 8),
              // ignore: prefer_const_constructors
              Text(
                'Founded in 2010, Union Shop has been serving students with quality university merchandise and daily essentials.',
                style: const TextStyle(fontSize: 16),
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
            ],
          ),
        ),
      ],
    );
  }
}
