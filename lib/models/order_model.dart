class Order {
  final String orderId;
  final List<OrderItem> items;
  final double totalAmount;
  final DateTime orderDate;
  final String status;

  Order({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.status = 'Completed',
  });

  // Helper method to get a formatted date string
  String getFormattedDate() {
    final now = DateTime.now();
    final difference = now.difference(orderDate);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  // Helper method to get time period for filtering
  String getTimePeriod() {
    final now = DateTime.now();
    final difference = now.difference(orderDate);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return 'Last Week';
    } else if (difference.inDays < 30) {
      return 'Last Month';
    } else if (difference.inDays < 90) {
      return 'Last 3 Months';
    } else if (difference.inDays < 365) {
      return 'Last Year';
    } else {
      return 'Older';
    }
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final double price;
  final String imageUrl;
  final int quantity;
  final String? selectedSize;
  final String? selectedColor;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.selectedSize,
    this.selectedColor,
  });

  // Factory constructor to create from CartItem
  factory OrderItem.fromCartItem(dynamic cartItem) {
    return OrderItem(
      productId: cartItem.productId,
      productName: cartItem.productName,
      price: cartItem.price,
      imageUrl: cartItem.imageUrl,
      quantity: cartItem.quantity,
      selectedSize: cartItem.selectedSize,
      selectedColor: cartItem.selectedColor,
    );
  }
}
