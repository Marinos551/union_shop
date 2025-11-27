import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';

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
  Product(
    title: 'University T-Shirt',
    price: '£19.99',
    imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
    category: 'Clothing',
  ),
  Product(
    title: 'Student Water Bottle',
    price: '£12.00',
    imageUrl: 'https://images.unsplash.com/photo-1523362628745-0c100150b504?w=400',
    category: 'Accessories',
  ),
];

class CollectionProductsPage extends StatelessWidget {
  const CollectionProductsPage({super.key});

  Widget _buildProductCard(Product product) {
    return InkWell(
      onTap: () {},
      child: Card(
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
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product.category,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(product.price),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          const HeaderWidget(),
          // Sort/Filter Controls
          Container(
            color: Colors.grey[50],
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Collection Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Sort by:'),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'Popular',
                      items: const [
                        DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                        DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                        DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
                        DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
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
                    const SizedBox(width: 16),
                    const Text('Price:'),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'All Prices',
                      items: const [
                        DropdownMenuItem(value: 'All Prices', child: Text('All Prices')),
                        DropdownMenuItem(value: 'Under £20', child: Text('Under £20')),
                      ],
                      onChanged: (value) {}, // no-op for now
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '${products.length} products',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
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
