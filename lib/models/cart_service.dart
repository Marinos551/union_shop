import 'package:flutter/material.dart';
import 'cart_model.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

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