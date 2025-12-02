import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/purchase_history_page.dart';

void main() {
  testWidgets('PurchaseHistoryPage renders correctly', (WidgetTester tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    
    // Create a GoRouter for context
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const PurchaseHistoryPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    // Verify the page renders
    expect(find.byType(PurchaseHistoryPage), findsOneWidget);
  });

  testWidgets('PurchaseHistoryPage displays empty state when no orders', (WidgetTester tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    
    // Create a GoRouter for context
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const PurchaseHistoryPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    // Check for empty state message
    expect(find.text('No Purchase History'), findsOneWidget);
  });

  testWidgets('PurchaseHistoryPage has title', (WidgetTester tester) async {
    // Set screen size to avoid overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    
    // Create a GoRouter for context
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const PurchaseHistoryPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    expect(find.text('Purchase History'), findsWidgets);
  });
}
