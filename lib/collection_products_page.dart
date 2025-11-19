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
      body: Column(
        children: [
          Container(
            color: Colors.grey[50],
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text('Sort by:'),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: 'Popular',
                  items: const [
                    DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                    DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
                  ],
                  onChanged: (value) {}, // no-op for now
                ),
                const Spacer(),
                const Text('Filter:'),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: 'All Categories',
                  items: const [
                    DropdownMenuItem(value: 'All Categories', child: Text('All Categories')),
                    DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                  ],
                  onChanged: (value) {}, // no-op for now
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
