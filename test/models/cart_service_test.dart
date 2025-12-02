import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('CartService Tests', () {
    late CartService cartService;

    setUp(() {
      cartService = CartService();
      cartService.clearCart();
      // Clear order history by accessing private field through completeCheckout
      while (cartService.orderHistory.isNotEmpty) {
        // We need to work with the existing order history
        break;
      }
    });

    test('should be a singleton', () {
      final instance1 = CartService();
      final instance2 = CartService();
      expect(identical(instance1, instance2), true);
    });

    test('items should be initially empty', () {
      expect(cartService.items, isEmpty);
    });

    test('addToCart should add new item', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test Product',
        price: 25.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);

      expect(cartService.items.length, 1);
      expect(cartService.items.first.productId, 'p1');
    });

    test('addToCart should combine quantities for same product', () {
      final item1 = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 20.00,
        imageUrl: 'test.jpg',
        quantity: 2,
      );

      cartService.addToCart(item1);
      cartService.addToCart(item1);

      expect(cartService.items.length, 1);
      expect(cartService.items.first.quantity, 4);
    });

    test('addToCart should keep separate items for different sizes', () {
      final itemM = CartItem(
        productId: 'p1',
        productName: 'Shirt',
        price: 20.00,
        imageUrl: 'shirt.jpg',
        quantity: 1,
        selectedSize: 'M',
      );

      final itemL = CartItem(
        productId: 'p1',
        productName: 'Shirt',
        price: 20.00,
        imageUrl: 'shirt.jpg',
        quantity: 1,
        selectedSize: 'L',
      );

      cartService.addToCart(itemM);
      cartService.addToCart(itemL);

      expect(cartService.items.length, 2);
    });

    test('removeFromCart should remove item', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 15.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);
      expect(cartService.items.length, 1);

      cartService.removeFromCart('p1');
      expect(cartService.items, isEmpty);
    });

    test('removeFromCart should remove specific size/color variant', () {
      final itemM = CartItem(
        productId: 'p1',
        productName: 'Shirt',
        price: 20.00,
        imageUrl: 'shirt.jpg',
        quantity: 1,
        selectedSize: 'M',
      );

      final itemL = CartItem(
        productId: 'p1',
        productName: 'Shirt',
        price: 20.00,
        imageUrl: 'shirt.jpg',
        quantity: 1,
        selectedSize: 'L',
      );

      cartService.addToCart(itemM);
      cartService.addToCart(itemL);

      cartService.removeFromCart('p1', size: 'M');

      expect(cartService.items.length, 1);
      expect(cartService.items.first.selectedSize, 'L');
    });

    test('updateQuantity should update item quantity', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 30.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);
      cartService.updateQuantity('p1', 5);

      expect(cartService.items.first.quantity, 5);
    });

    test('updateQuantity should remove item if quantity is 0', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 25.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);
      cartService.updateQuantity('p1', 0);

      expect(cartService.items, isEmpty);
    });

    test('updateItemQuantity should update quantity', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 20.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);
      cartService.updateItemQuantity('p1', 3);

      expect(cartService.items.first.quantity, 3);
    });

    test('updateItemQuantity should remove item if quantity <= 0', () {
      final item = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 15.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      );

      cartService.addToCart(item);
      cartService.updateItemQuantity('p1', -1);

      expect(cartService.items, isEmpty);
    });

    test('clearCart should remove all items', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item 1',
        price: 10.00,
        imageUrl: 'item1.jpg',
        quantity: 1,
      ));
      
      cartService.addToCart(CartItem(
        productId: 'p2',
        productName: 'Item 2',
        price: 20.00,
        imageUrl: 'item2.jpg',
        quantity: 1,
      ));

      cartService.clearCart();

      expect(cartService.items, isEmpty);
    });

    test('getItemCount should return total quantity', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item 1',
        price: 10.00,
        imageUrl: 'item1.jpg',
        quantity: 2,
      ));
      
      cartService.addToCart(CartItem(
        productId: 'p2',
        productName: 'Item 2',
        price: 20.00,
        imageUrl: 'item2.jpg',
        quantity: 3,
      ));

      expect(cartService.getItemCount(), 5);
    });

    test('getTotalAmount should calculate correct total', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item 1',
        price: 10.00,
        imageUrl: 'item1.jpg',
        quantity: 2,
      ));
      
      cartService.addToCart(CartItem(
        productId: 'p2',
        productName: 'Item 2',
        price: 15.00,
        imageUrl: 'item2.jpg',
        quantity: 3,
      ));

      expect(cartService.getTotalAmount(), 65.00);
    });

    test('getTotalPrice should calculate correct total', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item',
        price: 25.00,
        imageUrl: 'item.jpg',
        quantity: 4,
      ));

      expect(cartService.getTotalPrice(), 100.00);
    });

    test('isEmpty should return true for empty cart', () {
      expect(cartService.isEmpty, true);
    });

    test('isEmpty should return false for non-empty cart', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item',
        price: 10.00,
        imageUrl: 'item.jpg',
        quantity: 1,
      ));

      expect(cartService.isEmpty, false);
    });

    test('isNotEmpty should return false for empty cart', () {
      expect(cartService.isNotEmpty, false);
    });

    test('isNotEmpty should return true for non-empty cart', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item',
        price: 10.00,
        imageUrl: 'item.jpg',
        quantity: 1,
      ));

      expect(cartService.isNotEmpty, true);
    });

    test('completeCheckout should create order', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Test Product',
        price: 30.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      ));

      final order = cartService.completeCheckout();

      expect(order.items.length, 1);
      expect(order.totalAmount, 30.00);
      expect(cartService.items, isEmpty);
    });

    test('completeCheckout should throw exception for empty cart', () {
      expect(() => cartService.completeCheckout(), throwsException);
    });

    test('completeCheckout should add order to history', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Product',
        price: 20.00,
        imageUrl: 'product.jpg',
        quantity: 1,
      ));

      final initialOrderCount = cartService.orderHistory.length;
      cartService.completeCheckout();

      expect(cartService.orderHistory.length, initialOrderCount + 1);
    });

    test('completeCheckout should generate sequential order IDs', () {
      cartService.addToCart(CartItem(
        productId: 'p1',
        productName: 'Item',
        price: 15.00,
        imageUrl: 'item.jpg',
        quantity: 1,
      ));

      final order1 = cartService.completeCheckout();

      cartService.addToCart(CartItem(
        productId: 'p2',
        productName: 'Item 2',
        price: 25.00,
        imageUrl: 'item2.jpg',
        quantity: 1,
      ));

      final order2 = cartService.completeCheckout();

      expect(order1.orderId, isNot(equals(order2.orderId)));
    });

    test('addDummyOrders should add sample orders', () {
      cartService.addDummyOrders();

      expect(cartService.orderHistory.length, greaterThanOrEqualTo(3));
    });

    test('addDummyOrders should not add duplicates', () {
      cartService.addDummyOrders();
      final firstCount = cartService.orderHistory.length;
      
      cartService.addDummyOrders();
      final secondCount = cartService.orderHistory.length;

      expect(firstCount, equals(secondCount));
    });

    test('getOrdersByPeriod should return all orders for "All"', () {
      cartService.addDummyOrders();
      final orders = cartService.getOrdersByPeriod('All');

      expect(orders.length, cartService.orderHistory.length);
    });

    test('getOrdersByPeriod should filter by Today', () {
      cartService.addDummyOrders();
      final orders = cartService.getOrdersByPeriod('Today');

      for (final order in orders) {
        final difference = DateTime.now().difference(order.orderDate);
        expect(difference.inDays, 0);
      }
    });

    test('getOrdersByPeriod should filter by Yesterday', () {
      cartService.addDummyOrders();
      final orders = cartService.getOrdersByPeriod('Yesterday');

      for (final order in orders) {
        final difference = DateTime.now().difference(order.orderDate);
        expect(difference.inDays, 1);
      }
    });

    test('getOrdersByPeriod should filter by Last Week', () {
      cartService.addDummyOrders();
      final orders = cartService.getOrdersByPeriod('Last Week');

      for (final order in orders) {
        final difference = DateTime.now().difference(order.orderDate);
        expect(difference.inDays, lessThan(7));
      }
    });

    test('getOrdersByPeriod should filter by Last Month', () {
      cartService.addDummyOrders();
      final orders = cartService.getOrdersByPeriod('Last Month');

      for (final order in orders) {
        final difference = DateTime.now().difference(order.orderDate);
        expect(difference.inDays, lessThan(30));
      }
    });

    test('items should be unmodifiable', () {
      final items = cartService.items;
      expect(() => items.add(CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 10.00,
        imageUrl: 'test.jpg',
        quantity: 1,
      )), throwsUnsupportedError);
    });

    test('orderHistory should be unmodifiable', () {
      cartService.addDummyOrders();
      final orders = cartService.orderHistory;
      
      expect(() => orders.clear(), throwsUnsupportedError);
    });
  });
}
