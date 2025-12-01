import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterWidget extends StatelessWidget {
  final ValueNotifier<bool>? focusSearchNotifier;
  
  const FooterWidget({super.key, this.focusSearchNotifier});

  // Navigation methods
  void _navigateToHome(BuildContext context) {
    context.go('/');
  }

  void _navigateToCollections(BuildContext context) {
    context.go('/collections');
  }

  void _navigateToAbout(BuildContext context) {
    context.go('/about');
  }

  void _navigateToPrintShack(BuildContext context) {
    context.go('/print-shack');
  }

  void _navigateToPurchaseHistory(BuildContext context) {
    context.go('/purchase-history');
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
              const SizedBox(height: 8),
              // Responsive links layout
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Desktop: Two rows of links
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildFooterLinks(context),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildFooterLinks2(context),
                        ),
                      ],
                    );
                  } else {
                    // Mobile: Single column
                    return Column(
                      children: [
                        ..._buildFooterLinks(context),
                        const SizedBox(height: 8),
                        ..._buildFooterLinks2(context),
                      ],
                    );
                  }
                },
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
                  const SizedBox(width: 16),
                  // Search button that scrolls to top and focuses search
                  GestureDetector(
                    onTap: () {
                      // First scroll to top of the page
                      PrimaryScrollController.of(context).animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      // Then focus the search bar after a short delay
                      Future.delayed(const Duration(milliseconds: 600), () {
                        focusSearchNotifier?.value = true;
                      });
                    },
                    child: const Icon(Icons.search, color: Colors.grey),
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

  List<Widget> _buildFooterLinks(BuildContext context) {
    return [
      _buildFooterLink('Home', () => _navigateToHome(context)),
      if (MediaQuery.of(context).size.width > 600) const SizedBox(width: 16),
      _buildFooterLink('Products', () => _navigateToCollections(context)),
      if (MediaQuery.of(context).size.width > 600) const SizedBox(width: 16),
      _buildFooterLink('About', () => _navigateToAbout(context)),
    ];
  }

  List<Widget> _buildFooterLinks2(BuildContext context) {
    return [
      _buildFooterLink('Purchase History', () => _navigateToPurchaseHistory(context)),
      if (MediaQuery.of(context).size.width > 600) const SizedBox(width: 16),
      _buildFooterLink('Contact Us', () => _navigateToAbout(context)),
      if (MediaQuery.of(context).size.width > 600) const SizedBox(width: 16),
      _buildFooterLink('Support', () => _navigateToPrintShack(context)),
      if (MediaQuery.of(context).size.width > 600) const SizedBox(width: 16),
      _buildFooterLink('FAQ', () => _navigateToPrintShack(context)),
    ];
  }

  Widget _buildFooterLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(text, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}