import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/models/collection_model.dart';
import 'package:union_shop/data/collections_data.dart';

class CollectionProductsPage extends StatefulWidget {
  const CollectionProductsPage({super.key});

  @override
  State<CollectionProductsPage> createState() => _CollectionProductsPageState();
}

class _CollectionProductsPageState extends State<CollectionProductsPage> {
  String _sortBy = 'Popular';
  String _filterCategory = 'All Categories';
  String _filterPrice = 'All Prices';
  int _currentPage = 0;
  final int _productsPerPage = 8;

  List<Product> _getSortedAndFilteredProducts(List<Product> products) {
    List<Product> filtered = List.from(products);

    // Apply category filter
    if (_filterCategory != 'All Categories') {
      filtered = filtered.where((p) => p.category == _filterCategory).toList();
    }

    // Apply price filter
    if (_filterPrice == 'Under £20') {
      filtered = filtered.where((p) => p.displayPrice < 20).toList();
    } else if (_filterPrice == '£20 - £50') {
      filtered = filtered.where((p) => p.displayPrice >= 20 && p.displayPrice <= 50).toList();
    } else if (_filterPrice == 'Over £50') {
      filtered = filtered.where((p) => p.displayPrice > 50).toList();
    }

    // Apply sorting
    switch (_sortBy) {
      case 'Price: Low to High':
        filtered.sort((a, b) => a.displayPrice.compareTo(b.displayPrice));
        break;
      case 'Price: High to Low':
        filtered.sort((a, b) => b.displayPrice.compareTo(a.displayPrice));
        break;
      case 'Name: A-Z':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      // 'Popular' and 'Newest' use default collection order
      default:
        // Keep original order for Popular and Newest
        break;
    }

    return filtered;
  }

  List<Product> _getPaginatedProducts(List<Product> products) {
    final startIndex = _currentPage * _productsPerPage;
    if (startIndex >= products.length) {
      return [];
    }
    
    final endIndex = startIndex + _productsPerPage;
    return products.sublist(
      startIndex, 
      endIndex > products.length ? products.length : endIndex
    );
  }

  int _getTotalPages(int totalProducts) {
    return (totalProducts / _productsPerPage).ceil();
  }

  void _resetToFirstPage() {
    setState(() {
      _currentPage = 0;
    });
  }

  Widget _buildPaginationControls(int totalProducts) {
    final totalPages = _getTotalPages(totalProducts);
    
    if (totalPages <= 1) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _currentPage > 0 ? () {
              setState(() => _currentPage--);
            } : null,
            color: _currentPage > 0 ? const Color(0xFF4d2963) : Colors.grey,
          ),
          Text(
            'Page ${_currentPage + 1} of $totalPages',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _currentPage < totalPages - 1 ? () {
              setState(() => _currentPage++);
            } : null,
            color: _currentPage < totalPages - 1 ? const Color(0xFF4d2963) : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
            settings: RouteSettings(
              arguments: {'productId': product.id},
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Sale Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    product.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 150,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
                if (product.isOnSale)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${product.discountPercentage}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (!product.inStock)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Out of Stock',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                  const SizedBox(height: 8),
                  if (product.isOnSale)
                    Row(
                      children: [
                        Text(
                          '£${product.salePrice!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '£${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get collection ID from route arguments
    final String collectionId = ModalRoute.of(context)?.settings.arguments as String? ?? 'clothing';
    
    // Get collection and products
    final Collection collection = collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => collections.first,
    );
    final List<Product> collectionProducts = getProductsByCollection(collection.id);
    final List<Product> displayedProducts = _getSortedAndFilteredProducts(collectionProducts);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderWidget(),
            // Collection Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    collection.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    collection.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Sort/Filter Controls
            Container(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Sort:'),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _sortBy,
                        items: const [
                          DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                          DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                          DropdownMenuItem(value: 'Price: Low to High', child: Text('Price: Low to High')),
                          DropdownMenuItem(value: 'Price: High to Low', child: Text('Price: High to Low')),
                          DropdownMenuItem(value: 'Name: A-Z', child: Text('Name: A-Z')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _sortBy = value);
                            // Remove the demo snackbar - functionality is now real
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Category:'),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _filterCategory,
                        items: const [
                          DropdownMenuItem(value: 'All Categories', child: Text('All Categories')),
                          DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                          DropdownMenuItem(value: 'Accessories', child: Text('Accessories')),
                          DropdownMenuItem(value: 'Stationery', child: Text('Stationery')),
                          DropdownMenuItem(value: 'Electronics', child: Text('Electronics')),
                          DropdownMenuItem(value: 'Backpacks', child: Text('Backpacks')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _filterCategory = value);
                            // Remove the demo snackbar - functionality is now real
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Price:'),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _filterPrice,
                        items: const [
                          DropdownMenuItem(value: 'All Prices', child: Text('All Prices')),
                          DropdownMenuItem(value: 'Under £20', child: Text('Under £20')),
                          DropdownMenuItem(value: '£20 - £50', child: Text('£20 - £50')),
                          DropdownMenuItem(value: 'Over £50', child: Text('Over £50')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _filterPrice = value);
                            // Remove the demo snackbar - functionality is now real
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Product Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${displayedProducts.length} ${displayedProducts.length == 1 ? 'product' : 'products'}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            // Products Grid
            displayedProducts.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(displayedProducts[index], context);
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