import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/collections_data.dart';

void main() {
  group('allProducts', () {
    test('should have 20 products', () {
      expect(allProducts.length, 20);
    });

    test('all products should have required fields', () {
      for (final product in allProducts) {
        expect(product.id, isNotEmpty);
        expect(product.name, isNotEmpty);
        expect(product.description, isNotEmpty);
        expect(product.price, greaterThan(0));
        expect(product.imageUrl, isNotEmpty);
        expect(product.collectionId, isNotEmpty);
        expect(product.category, isNotEmpty);
      }
    });
  });

  group('getProductsByCollection', () {
    test('should return products for clothing collection', () {
      final products = getProductsByCollection('clothing');
      expect(products.length, 5);
      expect(products.every((p) => p.collectionId == 'clothing'), isTrue);
    });

    test('should return products for accessories collection', () {
      final products = getProductsByCollection('accessories');
      expect(products.length, 4);
      expect(products.every((p) => p.collectionId == 'accessories'), isTrue);
    });

    test('should return products for stationery collection', () {
      final products = getProductsByCollection('stationery');
      expect(products.length, 4);
      expect(products.every((p) => p.collectionId == 'stationery'), isTrue);
    });

    test('should return products for electronics collection', () {
      final products = getProductsByCollection('electronics');
      expect(products.length, 3);
      expect(products.every((p) => p.collectionId == 'electronics'), isTrue);
    });

    test('should return products for backpacks collection', () {
      final products = getProductsByCollection('backpacks');
      expect(products.length, 2);
      expect(products.every((p) => p.collectionId == 'backpacks'), isTrue);
    });

    test('should return products for newarrivals collection', () {
      final products = getProductsByCollection('newarrivals');
      expect(products.length, 2);
      expect(products.every((p) => p.collectionId == 'newarrivals'), isTrue);
    });

    test('should return bestsellers with specific products', () {
      final products = getProductsByCollection('bestsellers');
      expect(products.length, 6);
      
      final productIds = products.map((p) => p.id).toList();
      expect(productIds, contains('p1')); // Classic Hoodie
      expect(productIds, contains('p2')); // Union T-Shirt
      expect(productIds, contains('p6')); // Classic Beanie Hat
      expect(productIds, contains('p7')); // Lanyard
      expect(productIds, contains('p10')); // A5 Notebook
      expect(productIds, contains('p11')); // Ballpoint Pen
    });

    test('should return empty list for non-existent collection', () {
      final products = getProductsByCollection('nonexistent');
      expect(products, isEmpty);
    });
  });

  group('getSaleProducts', () {
    test('should return only products on sale', () {
      final saleProducts = getSaleProducts();
      
      expect(saleProducts.isNotEmpty, isTrue);
      expect(saleProducts.every((p) => p.isOnSale == true), isTrue);
      expect(saleProducts.every((p) => p.salePrice != null), isTrue);
      expect(saleProducts.every((p) => p.discountPercentage > 0), isTrue);
    });

    test('should include specific sale products', () {
      final saleProducts = getSaleProducts();
      final productIds = saleProducts.map((p) => p.id).toList();
      
      expect(productIds, contains('p4')); // Varsity Jacket
      expect(productIds, contains('p8')); // Knitted Scarf
      expect(productIds, contains('p13')); // Academic Planner
      expect(productIds, contains('p15')); // Power Bank
      expect(productIds, contains('p20')); // Sports Water Bottle
    });
  });

  group('getInStockProducts', () {
    test('should return only products in stock', () {
      final inStockProducts = getInStockProducts();
      
      expect(inStockProducts.isNotEmpty, isTrue);
      expect(inStockProducts.every((p) => p.inStock == true), isTrue);
    });

    test('should return all products since all are in stock', () {
      final inStockProducts = getInStockProducts();
      expect(inStockProducts.length, allProducts.length);
    });
  });

  group('searchProducts', () {
    test('should find products by name', () {
      final results = searchProducts('hoodie');
      
      expect(results.isNotEmpty, isTrue);
      expect(results.any((p) => p.name.toLowerCase().contains('hoodie')), isTrue);
    });

    test('should find products by description', () {
      final results = searchProducts('bluetooth');
      
      expect(results.isNotEmpty, isTrue);
      expect(results.any((p) => p.description.toLowerCase().contains('bluetooth')), isTrue);
    });

    test('should find products by category', () {
      final results = searchProducts('clothing');
      
      expect(results.isNotEmpty, isTrue);
      expect(results.every((p) => p.category.toLowerCase().contains('clothing')), isTrue);
    });

    test('should be case insensitive', () {
      final lowerResults = searchProducts('hoodie');
      final upperResults = searchProducts('HOODIE');
      final mixedResults = searchProducts('HoOdIe');
      
      expect(lowerResults.length, upperResults.length);
      expect(lowerResults.length, mixedResults.length);
    });

    test('should return empty list for non-matching query', () {
      final results = searchProducts('xyznonexistent123');
      expect(results, isEmpty);
    });

    test('should find multiple products with common term', () {
      final results = searchProducts('union');
      
      expect(results.length, greaterThan(1));
    });
  });

  group('collections', () {
    test('should have 7 collections', () {
      expect(collections.length, 7);
    });

    test('all collections should have required fields', () {
      for (final collection in collections) {
        expect(collection.id, isNotEmpty);
        expect(collection.name, isNotEmpty);
        expect(collection.description, isNotEmpty);
        expect(collection.imageUrl, isNotEmpty);
        expect(collection.productCount, greaterThan(0));
        expect(collection.tags, isNotEmpty);
      }
    });

    test('should include all expected collections', () {
      final collectionIds = collections.map((c) => c.id).toList();
      
      expect(collectionIds, contains('clothing'));
      expect(collectionIds, contains('accessories'));
      expect(collectionIds, contains('stationery'));
      expect(collectionIds, contains('electronics'));
      expect(collectionIds, contains('backpacks'));
      expect(collectionIds, contains('bestsellers'));
      expect(collectionIds, contains('newarrivals'));
    });

    test('product counts should match actual products', () {
      for (final collection in collections) {
        final actualProducts = getProductsByCollection(collection.id);
        expect(actualProducts.length, collection.productCount,
            reason: '${collection.name} collection count mismatch');
      }
    });
  });
}
