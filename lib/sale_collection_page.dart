import 'package:flutter/material.dart';

class SaleProduct {
  final String title;
  final String originalPrice;
  final String salePrice;
  final String imageUrl;
  final String category;
  final int discountPercent;

  SaleProduct({
    required this.title,
    required this.originalPrice,
    required this.salePrice,
    required this.imageUrl,
    required this.category,
    required this.discountPercent,
  });
}

// Sample sale products data
final List<SaleProduct> saleProducts = [
  SaleProduct(
    title: 'Classic University Hoodie',
    originalPrice: '£45.00',
    salePrice: '£29.99',
    imageUrl:
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    category: 'Clothing',
    discountPercent: 33,
  ),
  SaleProduct(
    title: 'Student Backpack',
    originalPrice: '£35.00',
    salePrice: '£19.99',
    imageUrl:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    category: 'Accessories',
    discountPercent: 43,
  ),
];

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Items'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Column(
        children: [
          // Promotional header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.red[50],
            child: const Column(
              children: [
                Text(
                  'SALE',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Limited time offers on selected items',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Rest of the content will go here
          Expanded(
            child: Center(
              child: Text('${saleProducts.length} sale items found'),
            ),
          ),
        ],
      ),
    );
  }
}