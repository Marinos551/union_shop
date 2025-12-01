import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/data/collections_data.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/product_page.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];
  bool _showSearchResults = false;
  final FocusNode _searchFocusNode = FocusNode();

  // Method to focus search from external widgets
  void focusSearch() {
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showSearchResults = false;
      });
      return;
    }

    setState(() {
      _searchResults = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()) ||
              product.category.toLowerCase().contains(query.toLowerCase()))
          .take(5)
          .toList();
      _showSearchResults = _searchResults.isNotEmpty;
    });
  }

  void _navigateToProduct(Product product) {
    setState(() {
      _showSearchResults = false;
      _searchController.clear();
    });
    _searchFocusNode.unfocus();
    
    context.go('/product/${product.id}');
  }

  // Navigation helper methods
  void navigateToHome(BuildContext context) {
    context.go('/');
  }

  void navigateToCollections(BuildContext context) {
    context.go('/collections');
  }

  void navigateToSale(BuildContext context) {
    context.go('/sale');
  }

  void navigateToAbout(BuildContext context) {
    context.go('/about');
  }

  void navigateToAuth(BuildContext context) {
    context.go('/auth');
  }

  void navigateToPrintShack(BuildContext context) {
    context.go('/print-shack');
  }

  void navigateToPurchaseHistory(BuildContext context) {
    context.go('/purchase-history');
  }

  void placeholderCallback() {
    // Placeholder for buttons that don't have functionality yet
  }

  @override
  Widget build(BuildContext context) {
    // Watch the cart service for changes
    final cartService = Provider.of<CartService>(context);
    final cartItemCount = cartService.getItemCount();
    
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Stack(
      children: [
        Container(
          height: 100,
          color: Colors.white,
          child: Column(
            children: [
              // Top purple banner - always shows "Union Shop"
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'Union Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Main navigation bar
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // Logo on the left
                  GestureDetector(
                    onTap: () => navigateToHome(context),
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Navigation links in the center (desktop only)
                  if (!isMobile)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => navigateToHome(context),
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => navigateToCollections(context),
                            child: const Text(
                              'Collections',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => navigateToSale(context),
                            child: const Text(
                              'Sale',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => navigateToAbout(context),
                            child: const Text(
                              'About',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => navigateToPrintShack(context),
                            child: const Text(
                              'Print Shack',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Spacer for mobile
                  if (isMobile) const Spacer(),
                  // Icon buttons on the right
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Search field with dropdown
                      SizedBox(
                        width: isMobile ? 40 : 200,
                        child: Stack(
                          children: [
                            if (!isMobile)
                              TextField(
                                controller: _searchController,
                                focusNode: _searchFocusNode,
                                decoration: InputDecoration(
                                  hintText: 'Search products...',
                                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                                  prefixIcon: const Icon(Icons.search, size: 18, color: Colors.grey),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Color(0xFF4d2963)),
                                  ),
                                ),
                                style: const TextStyle(fontSize: 14),
                                onChanged: _performSearch,
                                onSubmitted: (value) {
                                  if (_searchResults.isNotEmpty) {
                                    _navigateToProduct(_searchResults.first);
                                  }
                                },
                              )
                            else
                              IconButton(
                                icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => _buildMobileSearchDialog(),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () => navigateToAuth(context),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.history,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        tooltip: 'Purchase History',
                        onPressed: () => navigateToPurchaseHistory(context),
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () {
                              context.go('/cart');
                            },
                          ),
                          if (cartItemCount > 0)
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '$cartItemCount',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (isMobile)
                        IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 18,
                          color: Colors.grey,
                        ),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (context) => _buildMobileMenu(context),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    // Search results overlay
    if (_showSearchResults && !isMobile) _buildSearchResults(),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (!_showSearchResults || _searchResults.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 100,
      right: 16,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 300,
          constraints: const BoxConstraints(maxHeight: 300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final product = _searchResults[index];
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, color: Colors.grey);
                      },
                    ),
                  ),
                ),
                title: Text(
                  product.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  '£${product.isOnSale ? product.salePrice!.toStringAsFixed(2) : product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: product.isOnSale ? Colors.red : Colors.grey[600],
                  ),
                ),
                onTap: () => _navigateToProduct(product),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMobileSearchDialog() {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: _performSearch,
              onSubmitted: (value) {
                if (_searchResults.isNotEmpty) {
                  Navigator.pop(context);
                  _navigateToProduct(_searchResults.first);
                }
              },
            ),
            const SizedBox(height: 16),
            if (_searchResults.isNotEmpty)
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final product = _searchResults[index];
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                      title: Text(product.name, style: const TextStyle(fontSize: 14)),
                      subtitle: Text(
                        '£${product.isOnSale ? product.salePrice!.toStringAsFixed(2) : product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 12, color: product.isOnSale ? Colors.red : Colors.grey[600]),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _navigateToProduct(product);
                      },
                    );
                  },
                ),
              )
            else if (_searchController.text.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No products found', style: TextStyle(color: Colors.grey)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF4d2963)),
              title: const Text('Home', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                navigateToHome(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections, color: Color(0xFF4d2963)),
              title: const Text('Collections', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                navigateToCollections(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer, color: Color(0xFF4d2963)),
              title: const Text('Sale', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                navigateToSale(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF4d2963)),
              title: const Text('About', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                navigateToAbout(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.print, color: Color(0xFF4d2963)),
              title: const Text('Print Shack', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                navigateToPrintShack(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
