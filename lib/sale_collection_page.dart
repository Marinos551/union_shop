import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';

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
    imageUrl: 'assets/images/ClassicHoodie.webp',
    category: 'Clothing',
    discountPercent: 33,
  ),
  SaleProduct(
    title: 'Student Backpack',
    originalPrice: '£35.00',
    salePrice: '£19.99',
    imageUrl: 'assets/images/backpack.webp',
    category: 'Accessories',
    discountPercent: 43,
  ),
  SaleProduct(
    title: 'University T-Shirt',
    originalPrice: '£24.99',
    salePrice: '£14.99',
    imageUrl: 'assets/images/unitshirt.webp',
    category: 'Clothing',
    discountPercent: 40,
  ),
  SaleProduct(
    title: 'Student Water Bottle',
    originalPrice: '£18.00',
    salePrice: '£9.99',
    imageUrl: 'assets/images/bottle.webp',
    category: 'Accessories',
    discountPercent: 44,
  ),
  // NEW PRODUCT ADDED BELOW
  SaleProduct(
    title: 'University Notebook Set',
    originalPrice: '£15.00',
    salePrice: '£8.99',
    imageUrl: 'assets/images/notebook.webp',
    category: 'Stationery',
    discountPercent: 40,
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
                  child: Image.asset(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderWidget(),
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
            // Product count - automatically updates with new products
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${saleProducts.length} sale items', // NOW SHOWS ${saleProducts.length} ITEMS
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Products grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2, // responsive columns
                crossAxisSpacing: 16, // space between columns
                mainAxisSpacing: 16, // space between rows
                childAspectRatio: 0.7, // card proportions
              ),
              itemCount: saleProducts.length,
              itemBuilder: (context, index) {
                return _buildSaleProductCard(saleProducts[index]);
              },
            ),
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
