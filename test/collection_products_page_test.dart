import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collection_products_page.dart';

void main() {
  group('CollectionProductsPage Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: CollectionProductsPage(),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check AppBar title
      expect(find.text('Collection Products'), findsWidgets);
    });

    testWidgets('should display sort dropdown', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Sort by dropdown
      expect(find.text('Sort by:'), findsOneWidget);
      expect(find.text('Popular'), findsOneWidget);
    });

    testWidgets('should display filter dropdowns', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check filter dropdowns
      expect(find.text('Filter:'), findsOneWidget);
      expect(find.text('All Categories'), findsOneWidget);
      expect(find.text('Price:'), findsOneWidget);
      expect(find.text('All Prices'), findsOneWidget);
    });

    testWidgets('should display product count', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check products count (should be 5 products)
      expect(find.text('5 products'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Card widgets are present
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display product titles', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product titles
      expect(find.text('Classic University Hoodie'), findsOneWidget);
      expect(find.text('Student Backpack'), findsOneWidget);
      expect(find.text('University Cap'), findsOneWidget);
    });

    testWidgets('should display product prices', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product prices
      expect(find.text('£39.99'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£9.00'), findsOneWidget);
    });

    testWidgets('should display product categories', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product categories
      expect(find.text('Clothing'), findsWidgets);
      expect(find.text('Accessories'), findsWidgets);
    });

    testWidgets('should use GridView for product layout', (tester) async {
      // Ignore network image errors in tests (expected behavior)
      FlutterError.onError = (details) {
        if (!details.toString().contains('NetworkImageLoadException')) {
          FlutterError.presentError(details);
        }
      };

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
