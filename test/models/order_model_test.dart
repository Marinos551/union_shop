import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/order_model.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Order Model Tests', () {
    test('should create an order with all fields', () {
      final order = Order(
        orderId: 'order123',
        items: [],
        totalAmount: 50.00,
        orderDate: DateTime.now(),
        status: 'Completed',
      );

      expect(order.orderId, 'order123');
      expect(order.items, isEmpty);
      expect(order.totalAmount, 50.00);
      expect(order.status, 'Completed');
    });

    test('getFormattedDate should return "Today" for today', () {
      final order = Order(
        orderId: 'o1',
        items: [],
        totalAmount: 100.00,
        orderDate: DateTime.now(),
      );

      expect(order.getFormattedDate(), 'Today');
    });

    test('getFormattedDate should return "Yesterday" for yesterday', () {
      final order = Order(
        orderId: 'o2',
        items: [],
        totalAmount: 75.00,
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
      );

      expect(order.getFormattedDate(), 'Yesterday');
    });

    test('getFormattedDate should return days ago for recent dates', () {
      final order = Order(
        orderId: 'o3',
        items: [],
        totalAmount: 50.00,
        orderDate: DateTime.now().subtract(const Duration(days: 3)),
      );

      expect(order.getFormattedDate(), '3 days ago');
    });

    test('getFormattedDate should return weeks ago', () {
      final order = Order(
        orderId: 'o4',
        items: [],
        totalAmount: 60.00,
        orderDate: DateTime.now().subtract(const Duration(days: 14)),
      );

      expect(order.getFormattedDate(), '2 weeks ago');
    });

    test('getFormattedDate should return singular week', () {
      final order = Order(
        orderId: 'o5',
        items: [],
        totalAmount: 40.00,
        orderDate: DateTime.now().subtract(const Duration(days: 10)),
      );

      expect(order.getFormattedDate(), '1 week ago');
    });

    test('getFormattedDate should return months ago', () {
      final order = Order(
        orderId: 'o6',
        items: [],
        totalAmount: 80.00,
        orderDate: DateTime.now().subtract(const Duration(days: 60)),
      );

      expect(order.getFormattedDate(), '2 months ago');
    });

    test('getFormattedDate should return singular month', () {
      final order = Order(
        orderId: 'o7',
        items: [],
        totalAmount: 45.00,
        orderDate: DateTime.now().subtract(const Duration(days: 35)),
      );

      expect(order.getFormattedDate(), '1 month ago');
    });

    test('getFormattedDate should return years ago', () {
      final order = Order(
        orderId: 'o8',
        items: [],
        totalAmount: 100.00,
        orderDate: DateTime.now().subtract(const Duration(days: 730)),
      );

      expect(order.getFormattedDate(), '2 years ago');
    });

    test('getFormattedDate should return singular year', () {
      final order = Order(
        orderId: 'o9',
        items: [],
        totalAmount: 55.00,
        orderDate: DateTime.now().subtract(const Duration(days: 400)),
      );

      expect(order.getFormattedDate(), '1 year ago');
    });

    test('getTimePeriod should return "Today"', () {
      final order = Order(
        orderId: 'o10',
        items: [],
        totalAmount: 25.00,
        orderDate: DateTime.now(),
      );

      expect(order.getTimePeriod(), 'Today');
    });

    test('getTimePeriod should return "Yesterday"', () {
      final order = Order(
        orderId: 'o11',
        items: [],
        totalAmount: 30.00,
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
      );

      expect(order.getTimePeriod(), 'Yesterday');
    });

    test('getTimePeriod should return "Last Week"', () {
      final order = Order(
        orderId: 'o12',
        items: [],
        totalAmount: 40.00,
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
      );

      expect(order.getTimePeriod(), 'Last Week');
    });

    test('getTimePeriod should return "Last Month"', () {
      final order = Order(
        orderId: 'o13',
        items: [],
        totalAmount: 50.00,
        orderDate: DateTime.now().subtract(const Duration(days: 20)),
      );

      expect(order.getTimePeriod(), 'Last Month');
    });

    test('getTimePeriod should return "Last 3 Months"', () {
      final order = Order(
        orderId: 'o14',
        items: [],
        totalAmount: 65.00,
        orderDate: DateTime.now().subtract(const Duration(days: 60)),
      );

      expect(order.getTimePeriod(), 'Last 3 Months');
    });

    test('getTimePeriod should return "Last Year"', () {
      final order = Order(
        orderId: 'o15',
        items: [],
        totalAmount: 75.00,
        orderDate: DateTime.now().subtract(const Duration(days: 120)),
      );

      expect(order.getTimePeriod(), 'Last Year');
    });

    test('getTimePeriod should return "Older"', () {
      final order = Order(
        orderId: 'o16',
        items: [],
        totalAmount: 85.00,
        orderDate: DateTime.now().subtract(const Duration(days: 400)),
      );

      expect(order.getTimePeriod(), 'Older');
    });

    test('should have default status "Completed"', () {
      final order = Order(
        orderId: 'o17',
        items: [],
        totalAmount: 95.00,
        orderDate: DateTime.now(),
      );

      expect(order.status, 'Completed');
    });
  });

  group('OrderItem Model Tests', () {
    test('should create an order item with all fields', () {
      final orderItem = OrderItem(
        productId: 'p1',
        productName: 'Test Product',
        price: 29.99,
        imageUrl: 'test.jpg',
        quantity: 2,
        selectedSize: 'L',
        selectedColor: 'Green',
      );

      expect(orderItem.productId, 'p1');
      expect(orderItem.productName, 'Test Product');
      expect(orderItem.price, 29.99);
      expect(orderItem.imageUrl, 'test.jpg');
      expect(orderItem.quantity, 2);
      expect(orderItem.selectedSize, 'L');
      expect(orderItem.selectedColor, 'Green');
    });

    test('should create an order item without optional fields', () {
      final orderItem = OrderItem(
        productId: 'p2',
        productName: 'Simple Item',
        price: 19.99,
        imageUrl: 'simple.jpg',
        quantity: 1,
      );

      expect(orderItem.selectedSize, isNull);
      expect(orderItem.selectedColor, isNull);
    });

    test('OrderItem.fromCartItem should create from CartItem', () {
      final cartItem = CartItem(
        productId: 'p3',
        productName: 'Cart Product',
        price: 35.00,
        imageUrl: 'cart.jpg',
        quantity: 3,
        selectedSize: 'XL',
        selectedColor: 'Blue',
      );

      final orderItem = OrderItem.fromCartItem(cartItem);

      expect(orderItem.productId, cartItem.productId);
      expect(orderItem.productName, cartItem.productName);
      expect(orderItem.price, cartItem.price);
      expect(orderItem.imageUrl, cartItem.imageUrl);
      expect(orderItem.quantity, cartItem.quantity);
      expect(orderItem.selectedSize, cartItem.selectedSize);
      expect(orderItem.selectedColor, cartItem.selectedColor);
    });
  });
}
