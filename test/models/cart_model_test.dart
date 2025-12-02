import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('CartItem Model Tests', () {
    test('should create a cart item with all fields', () {
      final cartItem = CartItem(
        productId: 'p1',
        productName: 'Test Product',
        price: 25.99,
        imageUrl: 'test.jpg',
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Blue',
      );

      expect(cartItem.productId, 'p1');
      expect(cartItem.productName, 'Test Product');
      expect(cartItem.price, 25.99);
      expect(cartItem.imageUrl, 'test.jpg');
      expect(cartItem.quantity, 2);
      expect(cartItem.selectedSize, 'M');
      expect(cartItem.selectedColor, 'Blue');
    });

    test('should create a cart item without optional fields', () {
      final cartItem = CartItem(
        productId: 'p2',
        productName: 'Simple Product',
        price: 15.00,
        imageUrl: 'simple.jpg',
        quantity: 1,
      );

      expect(cartItem.selectedSize, isNull);
      expect(cartItem.selectedColor, isNull);
    });

    test('copyWith should update specified fields', () {
      final original = CartItem(
        productId: 'p1',
        productName: 'Original',
        price: 20.00,
        imageUrl: 'original.jpg',
        quantity: 1,
      );

      final updated = original.copyWith(
        quantity: 3,
        selectedSize: 'L',
      );

      expect(updated.quantity, 3);
      expect(updated.selectedSize, 'L');
      expect(updated.productId, 'p1'); // unchanged
      expect(updated.productName, 'Original'); // unchanged
      expect(updated.price, 20.00); // unchanged
    });

    test('copyWith should preserve fields when not specified', () {
      final original = CartItem(
        productId: 'p1',
        productName: 'Test',
        price: 25.00,
        imageUrl: 'test.jpg',
        quantity: 2,
        selectedSize: 'M',
        selectedColor: 'Red',
      );

      final copied = original.copyWith();

      expect(copied.productId, original.productId);
      expect(copied.productName, original.productName);
      expect(copied.price, original.price);
      expect(copied.imageUrl, original.imageUrl);
      expect(copied.quantity, original.quantity);
      expect(copied.selectedSize, original.selectedSize);
      expect(copied.selectedColor, original.selectedColor);
    });

    test('copyWith should update all fields when all are specified', () {
      final original = CartItem(
        productId: 'p1',
        productName: 'Original',
        price: 20.00,
        imageUrl: 'original.jpg',
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Black',
      );

      final updated = original.copyWith(
        productId: 'p2',
        productName: 'Updated',
        price: 30.00,
        imageUrl: 'updated.jpg',
        quantity: 5,
        selectedSize: 'XL',
        selectedColor: 'White',
      );

      expect(updated.productId, 'p2');
      expect(updated.productName, 'Updated');
      expect(updated.price, 30.00);
      expect(updated.imageUrl, 'updated.jpg');
      expect(updated.quantity, 5);
      expect(updated.selectedSize, 'XL');
      expect(updated.selectedColor, 'White');
    });
  });
}
