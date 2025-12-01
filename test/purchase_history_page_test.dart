import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/purchase_history_page.dart';

void main() {
  testWidgets('PurchaseHistoryPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const PurchaseHistoryPage(),
        ),
      ),
    );

    // Verify the page renders
    expect(find.byType(PurchaseHistoryPage), findsOneWidget);
  });

  testWidgets('PurchaseHistoryPage displays empty state when no orders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const PurchaseHistoryPage(),
        ),
      ),
    );

    // Check for empty state message
    expect(find.text('No orders yet'), findsOneWidget);
  });

  testWidgets('PurchaseHistoryPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const PurchaseHistoryPage(),
        ),
      ),
    );

    expect(find.text('Purchase History'), findsOneWidget);
  });
}
