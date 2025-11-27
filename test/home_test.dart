import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('HomeScreen widget tests', () {
    testWidgets('renders header and browse button', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Header top banner contains 'Union Shop'
      expect(find.text('Union Shop'), findsOneWidget);

      // Browse products button is present
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
    });

    testWidgets('has featured categories and navigates to Sale page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // The featured category icon for Sale should be present
      final saleIcon = find.byIcon(Icons.local_offer_outlined);
      expect(saleIcon, findsOneWidget);

      // Tap the sale icon and verify navigation to SaleCollectionPage
      await tester.tap(saleIcon);
      await tester.pumpAndSettle();

      // After navigation, the AppBar title of the sale page should be visible
      expect(find.text('Sale Items'), findsOneWidget);
    });

    testWidgets('contains product cards in the products grid', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // ProductCard widgets are used in the HomeScreen product grid
      expect(find.byType(ProductCard), findsWidgets);
    });
  });
}
