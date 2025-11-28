import 'package:union_shop/models/cart_model.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal() {
    _cart = Cart(items: []);
  }

  late Cart _cart;

  Cart get cart => _cart;

  void addToCart(CartItem item) {
    // Check if item already exists in cart
    final existingIndex = _cart.items.indexWhere(
      (cartItem) =>
          cartItem.productId == item.productId &&
          cartItem.selectedSize == item.selectedSize &&
          cartItem.selectedColor == item.selectedColor,
    );

    if (existingIndex != -1) {
      // Update quantity if item exists
      _cart.updateQuantity(
        item.productId,
        _cart.items[existingIndex].quantity + item.quantity,
      );
    } else {
      // Add new item
      _cart.addItem(item);
    }
  }

  void removeFromCart(String productId) {
    _cart.removeItem(productId);
  }

  void updateItemQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(productId);
    } else {
      _cart.updateQuantity(productId, newQuantity);
    }
  }

  void clearCart() {
    _cart.clear();
  }

  int getItemCount() {
    return _cart.totalItems;
  }

  double getTotalAmount() {
    return _cart.totalAmount;
  }
}