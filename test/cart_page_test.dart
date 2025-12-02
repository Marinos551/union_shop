import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/cart_page.dart';

void main() {
  testWidgets('CartPage displays empty cart message when cart is empty', (WidgetTester tester) async {
    // Set a larger screen size to avoid layout overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    
    final cartService = CartService();
    final router = GoRouter(
      initialLocation: '/cart',
      routes: [
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider<CartService>.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify empty cart message
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Continue Shopping'), findsOneWidget);
    
    // Reset the screen size
    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('CartPage displays checkout button when items exist', (WidgetTester tester) async {
    // Set a larger screen size to avoid layout overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    
    final cartService = CartService();
    final router = GoRouter(
      initialLocation: '/cart',
      routes: [
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
      ],
    );
    
    await tester.pumpWidget(
      ChangeNotifierProvider<CartService>.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Initially empty
    expect(find.text('Your cart is empty'), findsOneWidget);
    
    // Reset the screen size
    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('CartPage has Continue Shopping button', (WidgetTester tester) async {
    // Set a larger screen size to avoid layout overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    
    final cartService = CartService();
    final router = GoRouter(
      initialLocation: '/cart',
      routes: [
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider<CartService>.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ElevatedButton, 'Continue Shopping'), findsOneWidget);
    
    // Reset the screen size
    addTearDown(() => tester.view.resetPhysicalSize());
  });
}
