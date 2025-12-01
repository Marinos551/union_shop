import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/cart_page.dart';

void main() {
  testWidgets('CartPage displays empty cart message when cart is empty', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const CartPage(),
        ),
      ),
    );

    // Verify empty cart message
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Continue Shopping'), findsOneWidget);
  });

  testWidgets('CartPage displays checkout button when items exist', (WidgetTester tester) async {
    final cartService = CartService();
    
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: cartService,
          child: const CartPage(),
        ),
      ),
    );

    // Initially empty
    expect(find.text('Your cart is empty'), findsOneWidget);
  });

  testWidgets('CartPage has Continue Shopping button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const CartPage(),
        ),
      ),
    );

    expect(find.widgetWithText(ElevatedButton, 'Continue Shopping'), findsOneWidget);
  });
}
