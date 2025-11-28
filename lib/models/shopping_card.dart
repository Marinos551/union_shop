class CartItem {
  final String productId;
  final String productName;
  final double price;
  final String imageUrl;
  int quantity;
  final String? selectedSize;
  final String? selectedColor;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.selectedSize,
    this.selectedColor,
  });

  double get totalPrice => price * quantity;

  CartItem copyWith({
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      productId: productId,
      productName: productName,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

class Cart {
  final List<CartItem> items;

  Cart({required this.items});

  double get totalAmount {
    return items.fold(0, (total, item) => total + item.totalPrice);
  }

  int get totalItems {
    return items.fold(0, (total, item) => total + item.quantity);
  }

  void addItem(CartItem newItem) {
    items.add(newItem);
  }

  void removeItem(String productId) {
    items.removeWhere((item) => item.productId == productId);
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = items.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      items[index] = items[index].copyWith(quantity: newQuantity);
    }
  }

  void clear() {
    items.clear();
  }
}