import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Union Shop - Your Campus Store',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              // Quick Links
              Text(
                'Quick Links',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Added links row
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Home', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text('Products', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text('About', style: TextStyle(color: Colors.grey)),
                ],
              ),
              // Added contact section (as requested)
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contact Us', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text('Support', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text('FAQ', style: TextStyle(color: Colors.grey)),
                ],
              ),
              // Social Media
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.grey),
                  SizedBox(width: 16),
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 16),
                  Icon(Icons.camera_alt, color: Colors.grey),
                ],
              ),
              // Added copyright
              SizedBox(height: 16),
              Text(
                '© 2025 Union Shop. All rights reserved.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}