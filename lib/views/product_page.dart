import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/views/common_page_scaffold.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/data/collections_data.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/models/cart_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  String? _selectedSize;
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    // Get product ID from GoRouter
    final routeState = GoRouterState.of(context);
    final String productId = routeState.pathParameters['productId'] ?? 'p1';
    
    // Find the product
    final Product product = allProducts.firstWhere(
      (p) => p.id == productId,
      orElse: () => allProducts.first,
    );

    // Set default selections
    _selectedSize ??= product.sizes.isNotEmpty ? product.sizes.first : null;
    _selectedColor ??= product.colors.isNotEmpty ? product.colors.first : null;

    return CommonPageScaffold(
      padding: EdgeInsets.zero,
      children: [
        // Product details - Responsive layout
        Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;
                  
                  if (isWideScreen) {
                    // Desktop: Side-by-side layout
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Expanded(
                          flex: 1,
                          child: _buildProductImage(product),
                        ),
                        const SizedBox(width: 32),
                        // Product Details
                        Expanded(
                          flex: 1,
                          child: _buildProductDetails(product),
                        ),
                      ],
                    );
                  } else {
                    // Mobile: Stacked layout
                    return Column(
                      children: [
                        _buildProductImage(product),
                        const SizedBox(height: 24),
                        _buildProductDetails(product),
                      ],
                    );
                  }
                },
              ),
            ),
      ],
    );
  }

  Widget _buildProductImage(Product product) {
    return Container(
      height: MediaQuery.of(context).size.width > 800 ? 400 : 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Image unavailable',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (product.isOnSale)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '-${product.discountPercentage}% OFF',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (!product.inStock)
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'OUT OF STOCK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductDetails(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            product.category,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Product name
        Text(
          product.name,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width > 800 ? 32 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 12),

        // Product price
        Row(
          children: [
            if (product.isOnSale) ...[
              Text(
                '£${product.salePrice!.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 800 ? 32 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '£${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 800 ? 20 : 16,
                  color: Colors.grey[600],
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ] else
              Text(
                '£${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 800 ? 32 : 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4d2963),
                ),
              ),
          ],
        ),

        const SizedBox(height: 8),

        // Stock status
        Row(
          children: [
            Icon(
              product.inStock ? Icons.check_circle : Icons.cancel,
              size: 16,
              color: product.inStock ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 4),
            Text(
              product.inStock 
                  ? 'In Stock (${product.stockQuantity} available)'
                  : 'Out of Stock',
              style: TextStyle(
                fontSize: 14,
                color: product.inStock ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Size selector
        if (product.sizes.isNotEmpty) _buildSizeSelector(product),

        // Color selector
        if (product.colors.isNotEmpty) _buildColorSelector(product),

        // Quantity selector
        _buildQuantitySelector(product),

        const SizedBox(height: 16),

        // Selection summary
        _buildSelectionSummary(),

        const SizedBox(height: 16),

        // Add to Cart button
        _buildAddToCartButton(product),

        const SizedBox(height: 24),

        // Product description
        _buildProductDescription(product),
      ],
    );
  }

  Widget _buildSizeSelector(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: product.sizes.map((size) {
            return ChoiceChip(
              label: Text(size),
              selected: _selectedSize == size,
              selectedColor: const Color(0xFF4d2963),
              onSelected: (selected) {
                setState(() {
                  _selectedSize = size;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildColorSelector(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: product.colors.map((color) {
            return ChoiceChip(
              label: Text(color),
              selected: _selectedColor == color,
              selectedColor: const Color(0xFF4d2963),
              labelStyle: TextStyle(
                color: _selectedColor == color ? Colors.white : Colors.black,
              ),
              onSelected: (selected) {
                setState(() {
                  _selectedColor = color;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildQuantitySelector(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity--;
                  }
                });
              },
            ),
            Text(
              '$_quantity',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  if (_quantity < product.stockQuantity) {
                    _quantity++;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Maximum available: ${product.stockQuantity}'),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionSummary() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selected Options:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Quantity: $_quantity',
            style: const TextStyle(fontSize: 12),
          ),
          if (_selectedSize != null)
            Text(
              'Size: $_selectedSize',
              style: const TextStyle(fontSize: 12),
            ),
          if (_selectedColor != null)
            Text(
              'Color: $_selectedColor',
              style: const TextStyle(fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(Product product) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: product.inStock ? const Color(0xFF4d2963) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: product.inStock
            ? () {
                final cartService = Provider.of<CartService>(context, listen: false);
                final cartItem = CartItem(
                  productId: product.id,
                  productName: product.name,
                  price: product.isOnSale ? product.salePrice! : product.price,
                  imageUrl: product.imageUrl,
                  quantity: _quantity,
                  selectedSize: _selectedSize,
                  selectedColor: _selectedColor,
                );
                
                cartService.addToCart(cartItem);
                
                // Show snackbar with option to view cart
                String selectionInfo = '✓ Added to Cart: ${product.name} (Qty: $_quantity';
                if (_selectedSize != null) selectionInfo += ', Size: $_selectedSize';
                if (_selectedColor != null) selectionInfo += ', Color: $_selectedColor';
                selectionInfo += ')';
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(selectionInfo),
                    duration: const Duration(seconds: 4),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      label: 'VIEW CART',
                      textColor: Colors.white,
                      onPressed: () {
                        context.go('/cart');
                      },
                    ),
                  ),
                );
              }
            : null,
        child: Text(
          product.inStock ? 'Add to Cart' : 'Out of Stock',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildProductDescription(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
