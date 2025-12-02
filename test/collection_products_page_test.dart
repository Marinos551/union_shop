import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/collection_products_page.dart';

void main() {
  group('CollectionProductsPage Tests', () {
    Widget createTestWidget(WidgetTester tester) {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      final router = GoRouter(
        initialLocation: '/collection/clothing',
        routes: [
          GoRoute(
            path: '/collection/:collectionId',
            builder: (context, state) => const CollectionProductsPage(),
          ),
        ],
      );

      addTearDown(() => tester.view.resetPhysicalSize());

      return ChangeNotifierProvider<CartService>.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check collection name header (Clothing is the default collection)
      // Look for the larger text (size 32.0) which is the title
      expect(find.text('Clothing'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display sort dropdown', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check Sort by dropdown - look for the Popular text which is the default sort option
      expect(find.text('Popular'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display filter dropdowns', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check filter dropdowns - verify the default dropdown values exist
      expect(find.text('All Categories'), findsAtLeastNWidgets(1));
      expect(find.text('All Prices'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display product count', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check products count (should be 5 products)
      expect(find.text('5 products'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check that Card widgets are present
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display product titles', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product titles from Clothing collection
      expect(find.text('Classic Hoodie'), findsOneWidget);
      expect(find.text('Union T-Shirt'), findsOneWidget);
      expect(find.text('Classic Sweatshirt'), findsOneWidget);
    });

    testWidgets('should display product prices', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product prices from Clothing collection
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£11.00'), findsOneWidget);
      expect(find.text('£23.00'), findsOneWidget);
    });

    testWidgets('should display product categories', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product categories
      expect(find.text('Clothing'), findsWidgets);
    });

    testWidgets('should use GridView for product layout', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check that GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
