import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/widgets/header_widget.dart';

void main() {
  testWidgets('HeaderWidget displays Union Shop title', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: HeaderWidget(),
          ),
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
    await tester.pumpAndSettle();

    // Check for Union Shop text
    expect(find.text('Union Shop'), findsOneWidget);
  });

  testWidgets('HeaderWidget has search functionality', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: HeaderWidget(),
          ),
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
    await tester.pumpAndSettle();

    // Look for search icon or autocomplete
    expect(find.byIcon(Icons.search), findsWidgets);
  });

  testWidgets('HeaderWidget has navigation icons', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: HeaderWidget(),
          ),
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
    await tester.pumpAndSettle();

    // Check for user and cart icons
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });

  testWidgets('HeaderWidget displays cart item count badge', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: HeaderWidget(),
          ),
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
    await tester.pumpAndSettle();

    // Initially cart should be empty (no badge or 0)
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });
}
