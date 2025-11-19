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
  Product(
    title: 'Student Backpack',
    price: '£25.00',
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    category: 'Accessories',
  ),
  Product(
    title: 'University Cap',
    price: '£9.00',
    imageUrl: 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400',
    category: 'Accessories',
  ),
];

class CollectionProductsPage extends StatelessWidget {
  const CollectionProductsPage({super.key});

  Widget _buildProductCard(Product product) {
    return Card(
      child: Column(
        children: [
          Image.network(
            product.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                height: 150,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(product.title),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(product.price),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(products[index]);
        },
      ),
    );
  }
}
