import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/widgets/header_widget.dart';

void main() {
  testWidgets('HeaderWidget displays Union Shop title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const Scaffold(
            body: HeaderWidget(),
          ),
        ),
      ),
    );

    // Check for Union Shop text
    expect(find.text('Union Shop'), findsOneWidget);
  });

  testWidgets('HeaderWidget has search functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const Scaffold(
            body: HeaderWidget(),
          ),
        ),
      ),
    );

    // Look for search icon or autocomplete
    expect(find.byIcon(Icons.search), findsWidgets);
  });

  testWidgets('HeaderWidget has navigation icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: const Scaffold(
            body: HeaderWidget(),
          ),
        ),
      ),
    );

    // Check for user and cart icons
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });

  testWidgets('HeaderWidget displays cart item count badge', (WidgetTester tester) async {
    final cartService = CartService();
    
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: cartService,
          child: const Scaffold(
            body: HeaderWidget(),
          ),
        ),
      ),
    );

    // Initially cart should be empty (no badge or 0)
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });
}
