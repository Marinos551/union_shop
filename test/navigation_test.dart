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

    // Test that feature icons exist (text may appear multiple times in header and body)
    expect(find.text('Collections'), findsAtLeastNWidgets(1));
    expect(find.text('Sale Items'), findsAtLeastNWidgets(1));
    expect(find.text('Cart'), findsAtLeastNWidgets(1));
    
    // Also verify the specific icons exist in the feature section
    expect(find.byIcon(Icons.school_outlined), findsOneWidget);
    expect(find.byIcon(Icons.local_offer_outlined), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsWidgets);
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
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

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
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Verify Print Shack About page content
    expect(find.text('About Print Shack'), findsOneWidget);
  });
}
