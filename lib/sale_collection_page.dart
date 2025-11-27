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
    imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    category: 'Clothing',
    discountPercent: 33,
  ),
  SaleProduct(
    title: 'Student Backpack',
    originalPrice: '£35.00',
    salePrice: '£19.99',
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    category: 'Accessories',
    discountPercent: 43,
  ),
  SaleProduct(
    title: 'University T-Shirt',
    originalPrice: '£24.99',
    salePrice: '£14.99',
    imageUrl: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
    category: 'Clothing',
    discountPercent: 40,
  ),
  SaleProduct(
    title: 'Student Water Bottle',
    originalPrice: '£18.00',
    salePrice: '£9.99',
    imageUrl: 'https://images.unsplash.com/photo-1523362628745-0c100150b504?w=400',
    category: 'Accessories',
    discountPercent: 44,
  ),
  // NEW PRODUCT ADDED BELOW
  SaleProduct(
    title: 'University Notebook Set',
    originalPrice: '£15.00',
    salePrice: '£8.99',
    imageUrl: 'https://images.unsplash.com/photo-1586232702178-f044c5f4d4b7?w=400',
    category: 'Stationery',
    discountPercent: 33,
  ),
];
class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  Widget _buildSaleProductCard(SaleProduct product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Stack(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 150,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${product.discountPercent}% OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      product.salePrice,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      product.originalPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
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
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey, // ADD TEXT COLOR
                    ),
                  ),
                ),
                // CATEGORY BADGE ADDED TO PRODUCT CARDS
              ],
            ),
          ),
        ],
      ),
    );
  }

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
            child: Column(
              children: [
                const Text(
                  'SALE',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
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
          // Product count
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${saleProducts.length} sale items',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Products grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: saleProducts.length,
              itemBuilder: (context, index) {
                return _buildSaleProductCard(saleProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
