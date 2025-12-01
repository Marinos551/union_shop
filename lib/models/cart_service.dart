import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'order_model.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];
  final List<Order> _orderHistory = [];
  int _orderCounter = 1;

  List<CartItem> get items => List.unmodifiable(_items);
  List<Order> get orderHistory => List.unmodifiable(_orderHistory);

  // Complete checkout and create an order
  Order completeCheckout() {
    if (_items.isEmpty) {
      throw Exception('Cannot checkout with empty cart');
    }

    final orderItems = _items.map((item) => OrderItem.fromCartItem(item)).toList();
    final order = Order(
      orderId: 'ORD-${_orderCounter.toString().padLeft(5, '0')}',
      items: orderItems,
      totalAmount: getTotalAmount(),
      orderDate: DateTime.now(),
    );

    _orderHistory.insert(0, order); // Add to beginning for newest first
    _orderCounter++;
    _items.clear();
    notifyListeners();
    
    return order;
  }

  // Get orders filtered by time period
  List<Order> getOrdersByPeriod(String period) {
    if (period == 'All') return _orderHistory;

    final now = DateTime.now();
    return _orderHistory.where((order) {
      final difference = now.difference(order.orderDate);
      
      switch (period) {
        case 'Today':
          return difference.inDays == 0;
        case 'Yesterday':
          return difference.inDays == 1;
        case 'Last Week':
          return difference.inDays < 7;
        case 'Last Month':
          return difference.inDays < 30;
        case 'Last 3 Months':
          return difference.inDays < 90;
        case 'Last Year':
          return difference.inDays < 365;
        case 'Older':
          return difference.inDays >= 365;
        default:
          return true;
      }
    }).toList();
  }

  // Add some dummy orders for demonstration
  void addDummyOrders() {
    if (_orderHistory.isNotEmpty) return; // Only add if empty

    final now = DateTime.now();
    
    // Today's order
    _orderHistory.add(Order(
      orderId: 'ORD-00001',
      items: [
        OrderItem(
          productId: 'hoody-purple',
          productName: 'Purple University Hoodie',
          price: 34.99,
          imageUrl: 'assets/images/product1.jpg',
          quantity: 1,
          selectedSize: 'M',
          selectedColor: 'Purple',
        ),
      ],
      totalAmount: 34.99,
      orderDate: now,
    ));

    // Yesterday's order
    _orderHistory.add(Order(
      orderId: 'ORD-00002',
      items: [
        OrderItem(
          productId: 'tshirt-navy',
          productName: 'Navy T-Shirt',
          price: 18.99,
          imageUrl: 'assets/images/product2.jpg',
          quantity: 2,
          selectedSize: 'L',
        ),
        OrderItem(
          productId: 'notebook',
          productName: 'University Notebook',
          price: 5.99,
          imageUrl: 'assets/images/product6.jpg',
          quantity: 3,
        ),
      ],
      totalAmount: 55.95,
      orderDate: now.subtract(const Duration(days: 1)),
    ));

    // Last week's order
    _orderHistory.add(Order(
      orderId: 'ORD-00003',
      items: [
        OrderItem(
          productId: 'backpack',
          productName: 'Student Backpack',
          price: 45.99,
          imageUrl: 'assets/images/product3.jpg',
          quantity: 1,
          selectedColor: 'Black',
        ),
      ],
      totalAmount: 45.99,
      orderDate: now.subtract(const Duration(days: 5)),
    ));

    // Last month's order
    _orderHistory.add(Order(
      orderId: 'ORD-00004',
      items: [
        OrderItem(
          productId: 'mug',
          productName: 'University Mug',
          price: 12.99,
          imageUrl: 'assets/images/product7.jpg',
          quantity: 2,
        ),
        OrderItem(
          productId: 'cap',
          productName: 'Baseball Cap',
          price: 15.99,
          imageUrl: 'assets/images/product8.jpg',
          quantity: 1,
        ),
      ],
      totalAmount: 41.97,
      orderDate: now.subtract(const Duration(days: 20)),
    ));

    // 3 months ago order
    _orderHistory.add(Order(
      orderId: 'ORD-00005',
      items: [
        OrderItem(
          productId: 'jacket',
          productName: 'University Jacket',
          price: 69.99,
          imageUrl: 'assets/images/product4.jpg',
          quantity: 1,
          selectedSize: 'L',
        ),
      ],
      totalAmount: 69.99,
      orderDate: now.subtract(const Duration(days: 75)),
    ));

    _orderCounter = 6;
    notifyListeners();
  }

  void addToCart(CartItem item) {
    // Check if item already exists with same options
    final existingIndex = _items.indexWhere((existingItem) =>
        existingItem.productId == item.productId &&
        existingItem.selectedSize == item.selectedSize &&
        existingItem.selectedColor == item.selectedColor);

    if (existingIndex >= 0) {
      // Update quantity if item exists
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + item.quantity,
      );
    } else {
      // Add new item
      _items.add(item);
    }
    notifyListeners(); // This triggers UI updates
  }

  void removeFromCart(String productId, {String? size, String? color}) {
    _items.removeWhere((item) =>
        item.productId == productId &&
        item.selectedSize == size &&
        item.selectedColor == color);
    notifyListeners();
  }

  void updateItemQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(productId);
    } else {
      updateQuantity(productId, newQuantity);
    }
  }

  void updateQuantity(String productId, int quantity, {String? size, String? color}) {
    final index = _items.indexWhere((item) =>
        item.productId == productId &&
        item.selectedSize == size &&
        item.selectedColor == color);
    
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int getItemCount() {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  double getTotalAmount() {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  double getTotalPrice() {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  bool get isNotEmpty => _items.isNotEmpty;
  bool get isEmpty => _items.isEmpty;
}