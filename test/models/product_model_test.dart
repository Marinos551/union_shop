import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product_model.dart';

void main() {
  group('Product Model Tests', () {
    test('should create a product with all fields', () {
      const product = Product(
        id: 'p1',
        name: 'Test Hoodie',
        description: 'A comfortable hoodie',
        price: 45.00,
        imageUrl: 'hoodie.jpg',
        collectionId: 'c1',
        sizes: ['S', 'M', 'L'],
        colors: ['Black', 'White'],
        isOnSale: true,
        salePrice: 35.00,
        discountPercentage: 22,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 50,
      );

      expect(product.id, 'p1');
      expect(product.name, 'Test Hoodie');
      expect(product.price, 45.00);
      expect(product.salePrice, 35.00);
      expect(product.isOnSale, true);
      expect(product.inStock, true);
    });

    test('displayPrice should return sale price when on sale', () {
      const product = Product(
        id: 'p1',
        name: 'Sale Product',
        description: 'On sale',
        price: 50.00,
        imageUrl: 'sale.jpg',
        collectionId: 'c1',
        sizes: ['M'],
        colors: ['Red'],
        isOnSale: true,
        salePrice: 30.00,
        discountPercentage: 40,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 10,
      );

      expect(product.displayPrice, 30.00);
    });

    test('displayPrice should return regular price when not on sale', () {
      const product = Product(
        id: 'p2',
        name: 'Regular Product',
        description: 'Not on sale',
        price: 50.00,
        imageUrl: 'regular.jpg',
        collectionId: 'c1',
        sizes: ['L'],
        colors: ['Blue'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Accessories',
        inStock: true,
        stockQuantity: 20,
      );

      expect(product.displayPrice, 50.00);
    });

    test('displayPrice should return regular price when on sale but no sale price', () {
      const product = Product(
        id: 'p3',
        name: 'Product',
        description: 'Test',
        price: 40.00,
        imageUrl: 'test.jpg',
        collectionId: 'c1',
        sizes: ['S'],
        colors: ['Green'],
        isOnSale: true,
        salePrice: null,
        discountPercentage: 0,
        category: 'Stationery',
        inStock: true,
        stockQuantity: 15,
      );

      expect(product.displayPrice, 40.00);
    });

    test('hasMultipleSizes should return true for multiple sizes', () {
      const product = Product(
        id: 'p4',
        name: 'Multi-size',
        description: 'Has sizes',
        price: 25.00,
        imageUrl: 'multi.jpg',
        collectionId: 'c1',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['Black'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 30,
      );

      expect(product.hasMultipleSizes, true);
    });

    test('hasMultipleSizes should return false for single size', () {
      const product = Product(
        id: 'p5',
        name: 'Single-size',
        description: 'One size',
        price: 15.00,
        imageUrl: 'single.jpg',
        collectionId: 'c1',
        sizes: ['One Size'],
        colors: ['White'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Accessories',
        inStock: true,
        stockQuantity: 25,
      );

      expect(product.hasMultipleSizes, false);
    });

    test('hasMultipleSizes should return false for empty sizes', () {
      const product = Product(
        id: 'p6',
        name: 'No-size',
        description: 'No sizes',
        price: 10.00,
        imageUrl: 'none.jpg',
        collectionId: 'c1',
        sizes: [],
        colors: ['Gray'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Electronics',
        inStock: true,
        stockQuantity: 5,
      );

      expect(product.hasMultipleSizes, false);
    });

    test('hasMultipleColors should return true for multiple colors', () {
      const product = Product(
        id: 'p7',
        name: 'Multi-color',
        description: 'Has colors',
        price: 35.00,
        imageUrl: 'colors.jpg',
        collectionId: 'c1',
        sizes: ['M'],
        colors: ['Red', 'Blue', 'Green'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 40,
      );

      expect(product.hasMultipleColors, true);
    });

    test('hasMultipleColors should return false for single color', () {
      const product = Product(
        id: 'p8',
        name: 'Single-color',
        description: 'One color',
        price: 20.00,
        imageUrl: 'onecolor.jpg',
        collectionId: 'c1',
        sizes: ['L'],
        colors: ['Black'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Accessories',
        inStock: true,
        stockQuantity: 12,
      );

      expect(product.hasMultipleColors, false);
    });

    test('hasMultipleColors should return false for empty colors', () {
      const product = Product(
        id: 'p9',
        name: 'No-color',
        description: 'No colors',
        price: 8.00,
        imageUrl: 'nocolor.jpg',
        collectionId: 'c1',
        sizes: ['S'],
        colors: [],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Stationery',
        inStock: true,
        stockQuantity: 100,
      );

      expect(product.hasMultipleColors, false);
    });

    test('should handle out of stock products', () {
      const product = Product(
        id: 'p10',
        name: 'Out of Stock',
        description: 'Not available',
        price: 30.00,
        imageUrl: 'oos.jpg',
        collectionId: 'c1',
        sizes: ['M'],
        colors: ['Gray'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Clothing',
        inStock: false,
        stockQuantity: 0,
      );

      expect(product.inStock, false);
      expect(product.stockQuantity, 0);
    });

    test('should handle high discount percentage', () {
      const product = Product(
        id: 'p11',
        name: 'Big Sale',
        description: 'Huge discount',
        price: 100.00,
        imageUrl: 'bigsale.jpg',
        collectionId: 'c1',
        sizes: ['L'],
        colors: ['Yellow'],
        isOnSale: true,
        salePrice: 20.00,
        discountPercentage: 80,
        category: 'Electronics',
        inStock: true,
        stockQuantity: 5,
      );

      expect(product.discountPercentage, 80);
      expect(product.displayPrice, 20.00);
    });

    test('should be immutable with const constructor', () {
      const product1 = Product(
        id: 'p1',
        name: 'Immutable',
        description: 'Test',
        price: 25.00,
        imageUrl: 'test.jpg',
        collectionId: 'c1',
        sizes: ['M'],
        colors: ['Black'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 10,
      );

      const product2 = Product(
        id: 'p1',
        name: 'Immutable',
        description: 'Test',
        price: 25.00,
        imageUrl: 'test.jpg',
        collectionId: 'c1',
        sizes: ['M'],
        colors: ['Black'],
        isOnSale: false,
        discountPercentage: 0,
        category: 'Clothing',
        inStock: true,
        stockQuantity: 10,
      );

      expect(identical(product1, product2), true);
    });
  });
}
