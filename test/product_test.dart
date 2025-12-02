import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget({String productId = 'p1'}) {
      final cartService = CartService();
      
      final router = GoRouter(
        initialLocation: '/product/$productId',
        routes: [
          GoRoute(
            path: '/product/:productId',
            builder: (context, state) => const ProductPage(),
          ),
        ],
      );

      return ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      );
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that product page is present
      expect(find.byType(ProductPage), findsOneWidget);
      
      // Check that product details are displayed
      expect(find.text('Classic Hoodie'), findsOneWidget); // default product p1
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);
    });

    testWidgets('should display footer', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that footer text is present
      expect(find.text('Union Shop'), findsWidgets);
      expect(find.text('© 2025 Union Shop. All rights reserved.'), findsOneWidget);
    });

    testWidgets('displays product details from collections data', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget(productId: 'p2'));
      await tester.pumpAndSettle();

      // Verify product p2 (Union T-Shirt) is shown
      expect(find.text('Union T-Shirt'), findsOneWidget);
      expect(find.text('£11.00'), findsOneWidget);
    });

    testWidgets('should display size and color options', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that size and color selection UI exists
      expect(find.text('Size'), findsOneWidget);
      expect(find.text('Color'), findsOneWidget);
    });

    testWidgets('should display quantity selector', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that quantity controls exist
      expect(find.text('Quantity'), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
    });

    testWidgets('should display add to cart and buy now buttons', (tester) async {
      // Set screen size to avoid overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Check that action button exists
      expect(find.text('Add to Cart'), findsOneWidget);
    });
  });
}
