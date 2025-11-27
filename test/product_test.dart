import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget({String productId = 'p1'}) {
      return MaterialApp(
        home: const ProductPage(),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => const ProductPage(),
              settings: RouteSettings(
                arguments: {'productId': productId},
              ),
            );
          }
          return null;
        },
      );
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that HeaderWidget is present (contains shop name and icons)
      expect(find.byType(AppBar), findsWidgets);
      
      // Check that product details are displayed
      expect(find.text('Classic Hoodie'), findsOneWidget); // default product p1
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that footer text is present
      expect(find.text('Union Shop'), findsWidgets);
      expect(find.text('© 2024 Union Shop. All rights reserved.'), findsOneWidget);
    });

    testWidgets('displays product details from collections data', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'p2'));
      await tester.pumpAndSettle();

      // Verify product p2 (Beanie Hat) is shown
      expect(find.text('Beanie Hat'), findsOneWidget);
      expect(find.text('£12.00'), findsOneWidget);
    });

    testWidgets('should display size and color options', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that size and color selection UI exists
      expect(find.text('Size:'), findsOneWidget);
      expect(find.text('Color:'), findsOneWidget);
    });

    testWidgets('should display quantity selector', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that quantity controls exist
      expect(find.text('Quantity:'), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should display add to cart and buy now buttons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that action buttons exist
      expect(find.text('ADD TO CART'), findsOneWidget);
      expect(find.text('BUY NOW'), findsOneWidget);
    });
  });
}
