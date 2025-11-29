import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  // Navigation methods
  void _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _navigateToCollections(BuildContext context) {
    Navigator.pushNamed(context, '/collections');
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void _navigateToPrintShack(BuildContext context) {
    Navigator.pushNamed(context, '/print-shack');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Union Shop - Your Campus Store',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              // Quick Links
              const Text(
                'Quick Links',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Added links row
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _navigateToHome(context);
                    },
                    child: const Text('Home', style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      _navigateToCollections(context);
                    },
                    child: const Text('Products', style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      _navigateToAbout(context);
                    },
                    child: const Text('About', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              // Added contact section (as requested)
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Footer link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Text('Contact Us', style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Footer link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Text('Support', style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Footer link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Text('FAQ', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              // Social Media
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Social media link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Icon(Icons.facebook, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Social media link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Icon(Icons.share, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Social media link (demo)'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Icon(Icons.camera_alt, color: Colors.grey),
                  ),
                ],
              ),
              // Added copyright
              const SizedBox(height: 16),
              const Text(
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