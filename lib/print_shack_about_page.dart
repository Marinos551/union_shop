import 'package:flutter/material.dart';
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
            const HeaderWidget(),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
}
