import 'package:flutter/material.dart';

// Added Product model here (moved from lib/models/product.dart)
class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String category;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

// Added sample products list
final List<Product> products = [
  Product(
    title: 'Classic University Hoodie',
    price: '£39.99',
    imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    category: 'Clothing',
  ),
];

class CollectionProductsPage extends StatelessWidget {
  const CollectionProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('Collection Products Page'),
      ),
    );
  }
}
