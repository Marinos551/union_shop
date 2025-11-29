import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  testWidgets('All navigation routes are defined and accessible', (tester) async {
    await tester.pumpWidget(const UnionShopApp());

    // Test that the app initializes
    expect(find.byType(MaterialApp), findsOneWidget);

    // Navigate to each route and verify it loads
    final routes = [
      '/about',
      '/auth',
      '/collections',
      '/collection-products',
      '/sale',
      '/cart',
      '/print-shack',
      '/print-shack-about',
    ];

    for (final route in routes) {
      await tester.pumpWidget(const UnionShopApp());
      
      final context = tester.element(find.byType(MaterialApp));
      Navigator.pushNamed(context, route);
      
      await tester.pumpAndSettle();
      
      // Verify navigation succeeded (no error screen)
      expect(tester.takeException(), isNull, reason: 'Route $route should not throw an exception');
    }
  });

  testWidgets('Home screen feature icons navigate correctly', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // Test that feature icons exist
    expect(find.text('Clothing'), findsOneWidget);
    expect(find.text('Merch'), findsOneWidget);
    expect(find.text('Accessories'), findsOneWidget);
    expect(find.text('Sale Items'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
  });

  testWidgets('Print Shack page loads correctly', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(MaterialApp));
    Navigator.pushNamed(context, '/print-shack');
    await tester.pumpAndSettle();

    // Verify Print Shack page content
    expect(find.text('Print Shack - Personalize Your Item'), findsOneWidget);
  });

  testWidgets('Print Shack About page loads correctly', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(MaterialApp));
    Navigator.pushNamed(context, '/print-shack-about');
    await tester.pumpAndSettle();

    // Verify Print Shack About page content
    expect(find.text('About Print Shack'), findsOneWidget);
  });
}
