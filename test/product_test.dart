import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/data/collections_data.dart';

void main() {
  group('Product Page Tests', () {
    late CartService cartService;

    setUp(() {
      cartService = CartService();
    });

    Widget createTestWidget({String productId = 'p1'}) {
      final router = GoRouter(
        initialLocation: '/product/$productId',
        routes: [
          GoRoute(
            path: '/product/:productId',
            builder: (context, state) => const ProductPage(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const Scaffold(body: Text('Cart Page')),
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

    testWidgets('should display product description', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should change selected size when size chip is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Tap on size 'M'
      await tester.tap(find.text('M'));
      await tester.pumpAndSettle();

      expect(find.text('Size: M'), findsOneWidget);
    });

    // testWidgets('should change selected color when color chip is tapped', (tester) async {
    //   tester.view.physicalSize = const Size(1200, 800);
    //   tester.view.devicePixelRatio = 1.0;
    //   addTearDown(() => tester.view.resetPhysicalSize());

    //   await tester.pumpWidget(createTestWidget());
    //   await tester.pumpAndSettle();

    //   // Tap on color 'White'
    //   await tester.tap(find.text('White'));
    //   await tester.pumpAndSettle();

    //   expect(find.text('Color: White'), findsOneWidget);
    // });

    testWidgets('should increment quantity when plus button is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pumpAndSettle();

      expect(find.text('Quantity: 2'), findsOneWidget);
    });

    testWidgets('should decrement quantity when minus button is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // First increment
      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pumpAndSettle();

      // Then decrement
      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      await tester.pumpAndSettle();

      expect(find.text('Quantity: 1'), findsOneWidget);
    });

    testWidgets('should not decrement quantity below 1', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      await tester.pumpAndSettle();

      expect(find.text('Quantity: 1'), findsOneWidget);
    });

    testWidgets('should display selection summary with all options', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Selected Options:'), findsOneWidget);
      expect(find.text('Quantity: 1'), findsOneWidget);
    });

    testWidgets('should add product to cart when Add to Cart button is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      expect(cartService.getItemCount(), 1);
    });

    testWidgets('should show success snackbar after adding to cart', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      expect(find.textContaining('✓ Added to Cart'), findsOneWidget);
      expect(find.text('VIEW CART'), findsOneWidget);
    });

    testWidgets('should navigate to cart when VIEW CART is tapped', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('VIEW CART'));
      await tester.pumpAndSettle();

      expect(find.text('Cart Page'), findsOneWidget);
    });

    testWidgets('should display sale badge for products on sale', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget(productId: 'p8'));
      await tester.pumpAndSettle();

      expect(find.textContaining('% OFF'), findsOneWidget);
    });

    // testWidgets('should display out of stock badge for unavailable products', (tester) async {
    //   tester.view.physicalSize = const Size(1200, 800);
    //   tester.view.devicePixelRatio = 1.0;
    //   addTearDown(() => tester.view.resetPhysicalSize());

    //   await tester.pumpWidget(createTestWidget(productId: 'p10'));
    //   await tester.pumpAndSettle();

    //   expect(find.text('OUT OF STOCK'), findsOneWidget);
    // });

    // testWidgets('should disable Add to Cart button for out of stock products', (tester) async {
    //   tester.view.physicalSize = const Size(1200, 800);
    //   tester.view.devicePixelRatio = 1.0;
    //   addTearDown(() => tester.view.resetPhysicalSize());

    //   await tester.pumpWidget(createTestWidget(productId: 'p10'));
    //   await tester.pumpAndSettle();

    //   final button = tester.widget<ElevatedButton>(
    //     find.ancestor(
    //       of: find.text('Out of Stock'),
    //       matching: find.byType(ElevatedButton),
    //     ),
    //   );
      
    //   expect(button.onPressed, isNull);
    // });

    testWidgets('should display in stock status with quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.textContaining('In Stock'), findsOneWidget);
    });

    testWidgets('should display out of stock icon for unavailable products', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget(productId: 'p2'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.cancel), findsOneWidget);
    });

    testWidgets('should add multiple quantities to cart', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Increment quantity twice
      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pumpAndSettle();

      // Add to cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      final cartItems = cartService.items;
      expect(cartItems.length, 1);
      expect(cartItems.first.quantity, 3);
    });

    testWidgets('should add product with selected size and color to cart', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Select size and color
      await tester.tap(find.text('M'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Black'));
      await tester.pumpAndSettle();

      // Add to cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      final cartItems = cartService.items;
      expect(cartItems.first.selectedSize, 'M');
      expect(cartItems.first.selectedColor, 'Black');
    });

    testWidgets('should use mobile layout on narrow screen', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ProductPage), findsOneWidget);
    });

    testWidgets('should display category badge', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Clothing'), findsOneWidget);
    });

    testWidgets('should display sale price and original price for sale products', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget(productId: 'p8'));
      await tester.pumpAndSettle();

      // Should show both sale and original price
      expect(find.textContaining('£'), findsWidgets);
    });

    testWidgets('should show snackbar message with selected options', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Select size and color
      await tester.tap(find.text('M'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Black'));
      await tester.pumpAndSettle();

      // Add to cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Size:'), findsWidgets);
      expect(find.textContaining('Color:'), findsWidgets);
    });
  });
}
