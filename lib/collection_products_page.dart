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
