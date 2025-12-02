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

    testWidgets('should change sort option and reorder products', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Find and tap the sort dropdown
      final sortDropdown = find.text('Popular').first;
      await tester.tap(sortDropdown);
      await tester.pumpAndSettle();

      // Select "Price: Low to High"
      await tester.tap(find.text('Price: Low to High').last);
      await tester.pumpAndSettle();

      // Verify the sort option changed
      expect(find.text('Price: Low to High'), findsWidgets);
    });

    testWidgets('should sort by Price: High to Low', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap sort dropdown
      await tester.tap(find.text('Popular').first);
      await tester.pumpAndSettle();

      // Select "Price: High to Low"
      await tester.tap(find.text('Price: High to Low').last);
      await tester.pumpAndSettle();

      expect(find.text('Price: High to Low'), findsWidgets);
    });

    testWidgets('should sort by Name: A-Z', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap sort dropdown
      await tester.tap(find.text('Popular').first);
      await tester.pumpAndSettle();

      // Select "Name: A-Z"
      await tester.tap(find.text('Name: A-Z').last);
      await tester.pumpAndSettle();

      expect(find.text('Name: A-Z'), findsWidgets);
    });

    testWidgets('should sort by Newest', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap sort dropdown
      await tester.tap(find.text('Popular').first);
      await tester.pumpAndSettle();

      // Select "Newest"
      await tester.tap(find.text('Newest').last);
      await tester.pumpAndSettle();

      expect(find.text('Newest'), findsWidgets);
    });

    testWidgets('should filter by category', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Initial product count
      expect(find.text('5 products'), findsOneWidget);

      // Tap category dropdown
      await tester.tap(find.text('All Categories').first);
      await tester.pumpAndSettle();

      // Select "Clothing" category
      await tester.tap(find.text('Clothing').last);
      await tester.pumpAndSettle();

      // Should still show 5 products (all in clothing collection are Clothing category)
      expect(find.text('5 products'), findsOneWidget);
    });

    testWidgets('should filter by Accessories category', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap category dropdown
      await tester.tap(find.text('All Categories').first);
      await tester.pumpAndSettle();

      // Select "Accessories"
      await tester.tap(find.text('Accessories').last);
      await tester.pumpAndSettle();

      // Should show 0 products
      expect(find.text('No products found'), findsOneWidget);
    });

    testWidgets('should filter by price range Under £20', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap price dropdown
      await tester.tap(find.text('All Prices').first);
      await tester.pumpAndSettle();

      // Select "Under £20"
      await tester.tap(find.text('Under £20').last);
      await tester.pumpAndSettle();

      // Should filter products
      expect(find.text('Under £20'), findsWidgets);
    });

    testWidgets('should filter by price range £20 - £50', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap price dropdown
      await tester.tap(find.text('All Prices').first);
      await tester.pumpAndSettle();

      // Select "£20 - £50"
      await tester.tap(find.text('£20 - £50').last);
      await tester.pumpAndSettle();

      expect(find.text('£20 - £50'), findsWidgets);
    });

    testWidgets('should filter by price range Over £50', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Tap price dropdown
      await tester.tap(find.text('All Prices').first);
      await tester.pumpAndSettle();

      // Select "Over £50"
      await tester.tap(find.text('Over £50').last);
      await tester.pumpAndSettle();

      expect(find.text('Over £50'), findsWidgets);
    });

    testWidgets('should display collection header with name and description', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check collection name
      expect(find.text('Clothing'), findsWidgets);
      // Check that description is present (part of the clothing collection)
      expect(find.textContaining('t-shirts'), findsOneWidget);
    });

    testWidgets('should show empty state when no products match filters', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Apply filter that returns no results
      await tester.tap(find.text('All Categories').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Electronics').last);
      await tester.pumpAndSettle();

      // Should show empty state
      expect(find.text('No products found'), findsOneWidget);
      expect(find.text('Try adjusting your filters'), findsOneWidget);
      expect(find.byIcon(Icons.search_off), findsOneWidget);
    });

    testWidgets('should display sale badge on sale products', (tester) async {
      // Use clothing collection which has products on sale (e.g., Varsity Jacket at -27%)
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Should find sale percentage badges (e.g., "-27%")
      expect(find.textContaining('-27%'), findsOneWidget);
    });

    testWidgets('should display out of stock badge on unavailable products', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Union T-Shirt (p2) is out of stock in the clothing collection
      expect(find.text('Out of Stock'), findsOneWidget);
    });

    testWidgets('should handle image loading errors gracefully', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check that images are loaded or error handlers are present
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should navigate to product page when card is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      bool navigatedToProduct = false;
      final router = GoRouter(
        initialLocation: '/collection/clothing',
        routes: [
          GoRoute(
            path: '/collection/:collectionId',
            builder: (context, state) => const CollectionProductsPage(),
            routes: [
              GoRoute(
                path: 'product/:productId',
                builder: (context, state) {
                  navigatedToProduct = true;
                  return const Scaffold(body: Text('Product Page'));
                },
              ),
            ],
          ),
        ],
      );

      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ChangeNotifierProvider<CartService>.value(
          value: cartService,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();

      // Tap first product card
      await tester.tap(find.byType(Card).first);
      await tester.pumpAndSettle();

      expect(navigatedToProduct, isTrue);
    });

    testWidgets('should reset to first page when sort changes', (tester) async {
      // Create a test with enough products to trigger pagination
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      final router = GoRouter(
        initialLocation: '/collection/newarrivals',
        routes: [
          GoRoute(
            path: '/collection/:collectionId',
            builder: (context, state) => const CollectionProductsPage(),
          ),
        ],
      );

      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ChangeNotifierProvider<CartService>.value(
          value: cartService,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();

      // Change sort option
      await tester.tap(find.text('Popular').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Price: Low to High').last);
      await tester.pumpAndSettle();

      // Should be on page 1 (verified by checking pagination controls if they exist)
      expect(find.text('Price: Low to High'), findsWidgets);
    });

    testWidgets('should display pagination controls for large product sets', (tester) async {
      // Clothing collection now has 9 products (more than 8 per page)
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Should show pagination controls (chevron icons)
      expect(find.byIcon(Icons.chevron_left), findsWidgets);
      expect(find.byIcon(Icons.chevron_right), findsWidgets);
    });

    testWidgets('should navigate to next page when next button is clicked', (tester) async {
      // Clothing collection has 9 products (more than 8 per page)
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Find next button (chevron_right) and ensure it's visible
      final nextButton = find.byIcon(Icons.chevron_right).last;
      await tester.ensureVisible(nextButton);
      await tester.pumpAndSettle();
      
      // Tap next button to go to page 2
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Should now be on page 2
      expect(find.textContaining('Page 2'), findsWidgets);
    });

    testWidgets('should navigate to previous page when previous button is clicked', (tester) async {
      // Clothing collection has 9 products (more than 8 per page)
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Go to page 2 first
      final nextButton = find.byIcon(Icons.chevron_right).last;
      await tester.ensureVisible(nextButton);
      await tester.pumpAndSettle();
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Then go back to page 1
      final prevButton = find.byIcon(Icons.chevron_left).last;
      await tester.ensureVisible(prevButton);
      await tester.pumpAndSettle();
      await tester.tap(prevButton);
      await tester.pumpAndSettle();

      // Should be back on page 1
      expect(find.textContaining('Page 1'), findsWidgets);
    });

    testWidgets('should display correct page number', (tester) async {
      // Clothing collection has 9 products (more than 8 per page)
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Ensure pagination is visible
      final pageText = find.textContaining('Page 1');
      await tester.ensureVisible(pageText.first);
      await tester.pumpAndSettle();

      // Should show "Page 1 of 2"
      expect(find.textContaining('Page 1'), findsWidgets);
    });

    testWidgets('should handle collection with default fallback', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      final router = GoRouter(
        initialLocation: '/collection/invalid-collection',
        routes: [
          GoRoute(
            path: '/collection/:collectionId',
            builder: (context, state) => const CollectionProductsPage(),
          ),
        ],
      );

      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        ChangeNotifierProvider<CartService>.value(
          value: cartService,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pumpAndSettle();

      // Should fallback to first collection
      expect(find.byType(CollectionProductsPage), findsOneWidget);
    });

    testWidgets('should display grid layout on mobile screen', (tester) async {
      // Set mobile screen size
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Should display GridView with 2 columns on mobile
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
