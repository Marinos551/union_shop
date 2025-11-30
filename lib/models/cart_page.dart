import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/models/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartService _cartService = CartService();

  void _updateQuantity(String productId, int newQuantity) {
    setState(() {
      _cartService.updateItemQuantity(productId, newQuantity);
    });
  }

  void _removeItem(String productId) {
    setState(() {
      _cartService.removeFromCart(productId);
    });
  }

  void _clearCart() {
    setState(() {
      _cartService.clearCart();
    });
  }

  void _checkout() {
    if (_cartService.items.isEmpty) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed successfully! Total: £${_cartService.getTotalAmount().toStringAsFixed(2)}'),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
    
    // Clear cart after successful "order"
    Future.delayed(const Duration(seconds: 2), () {
      _clearCart();
    });
  }

  Widget _buildCartItem(CartItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, color: Colors.grey);
                },
              ),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (item.selectedSize != null)
                    Text(
                      'Size: ${item.selectedSize}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  if (item.selectedColor != null)
                    Text(
                      'Color: ${item.selectedColor}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    '£${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                ],
              ),
            ),
            // Quantity Controls
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 20),
                      onPressed: () {
                        _updateQuantity(item.productId, item.quantity - 1);
                      },
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed: () {
                        _updateQuantity(item.productId, item.quantity + 1);
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => _removeItem(item.productId),
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = _cartService.items;
    final totalAmount = _cartService.getTotalAmount();
    final totalItems = _cartService.getItemCount();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            // Page Title
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Shopping Cart ($totalItems ${totalItems == 1 ? 'item' : 'items'})',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Cart Items or Empty State
            if (cartItems.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/collections');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                      ),
                      child: const Text('Continue Shopping'),
                    ),
                  ],
                ),
              )
            else
              Column(
                children: [
                  // Cart Items List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(cartItems[index]);
                    },
                  ),
                  const SizedBox(height: 24),
                  // Order Summary
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal:'),
                            Text('£${totalAmount.toStringAsFixed(2)}'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Shipping:'),
                            const Text('Free'),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '£${totalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4d2963),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _clearCart,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Clear Cart'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _checkout,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Checkout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}