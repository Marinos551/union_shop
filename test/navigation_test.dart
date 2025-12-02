import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('All navigation routes are defined and accessible', (tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // Test that the app initializes
    expect(find.byType(MaterialApp), findsOneWidget);

    // Navigate to each route and verify it loads
    final routes = [
      '/about',
      '/auth',
      '/collections',
      '/collection/clothing',  // Changed from /collection-products
      '/sale',
      '/cart',
      '/print-shack',
      '/print-shack-about',
    ];

    for (final route in routes) {
      // Get a fresh context for each navigation
      final scaffoldFinder = find.byType(Scaffold).first;
      if (scaffoldFinder.evaluate().isNotEmpty) {
        final BuildContext context = tester.element(scaffoldFinder);
        context.go(route);
        
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
        
        // Verify navigation succeeded (no error screen)
        expect(tester.takeException(), isNull, reason: 'Route $route should not throw an exception');
        
        // Navigate back to home for next iteration
        final newScaffoldFinder = find.byType(Scaffold).first;
        if (newScaffoldFinder.evaluate().isNotEmpty) {
          final BuildContext newContext = tester.element(newScaffoldFinder);
          newContext.go('/');
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 500));
        }
      }
    }
  });

  testWidgets('Home screen feature icons navigate correctly', (tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // Test Collections icon navigation
    final collectionsIcon = find.byIcon(Icons.school_outlined);
    expect(collectionsIcon, findsOneWidget);
    await tester.tap(collectionsIcon);
    await tester.pumpAndSettle();
    expect(find.text('Explore our curated collections'), findsOneWidget);
    
    // Go back to home
    var context = tester.element(find.byType(Scaffold).first);
    context.go('/');
    await tester.pumpAndSettle();
    
    // Test Sale Items icon navigation
    final saleIcon = find.byIcon(Icons.local_offer_outlined);
    expect(saleIcon, findsOneWidget);
    await tester.tap(saleIcon);
    await tester.pumpAndSettle();
    expect(find.text('SALE'), findsOneWidget);
    
    // Go back to home
    context = tester.element(find.byType(Scaffold).first);
    context.go('/');
    await tester.pumpAndSettle();
    
    // Test Cart icon navigation (use last to avoid header cart icon)
    final cartIcon = find.byIcon(Icons.shopping_cart_outlined).last;
    expect(cartIcon, findsOneWidget);
    await tester.tap(cartIcon);
    await tester.pumpAndSettle();
    expect(find.text('Your cart is empty'), findsOneWidget);
  });

  testWidgets('Print Shack page loads correctly', (tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    context.go('/print-shack');
    await tester.pumpAndSettle();

    // Verify Print Shack page content
    expect(find.text('Print Shack - Personalize Your Item'), findsOneWidget);
  });

  testWidgets('Print Shack About page loads correctly', (tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold).first);
    context.go('/print-shack-about');
    await tester.pumpAndSettle();

    // Verify Print Shack About page content
    expect(find.text('About Print Shack'), findsOneWidget);
  });
}
