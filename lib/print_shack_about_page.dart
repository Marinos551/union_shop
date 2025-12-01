import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            HeaderWidget(key: headerKey),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF4d2963)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: 'Go back',
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                  ),
                  const Text(
                    'About Print Shack',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Text(
                    'Your campus printing and personalization service',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Service Description
                  const Text(
                    'Our Service',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Print Shack offers high-quality custom printing services for students and staff. '
                    'Personalize your items with text, logos, or designs to make them truly unique.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // What We Offer
                  const Text(
                    'What We Offer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFeatureItem('T-Shirts & Hoodies', 'Custom printed clothing'),
                      _buildFeatureItem('Mugs & Drinkware', 'Personalized drink containers'),
                      _buildFeatureItem('Stationery', 'Custom notebooks and pens'),
                      _buildFeatureItem('Text Personalization', 'Add your own text in various fonts and colors'),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Turnaround Time
                  const Text(
                    'Turnaround Time',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Standard orders: 3-5 business days\n'
                    'Express service: 1-2 business days (additional fee applies)',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Contact Info
                  const Text(
                    'Contact Print Shack',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Location: Student Union Building, Ground Floor\n'
                    'Email: printshack@unionshop.com\n'
                    'Phone: +44 123 456 7891\n'
                    'Hours: Mon-Fri 9:00-17:00',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Navigation to personalization
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/print-shack');
                      },
                      child: const Text(
                        'Start Personalizing',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF4d2963), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
