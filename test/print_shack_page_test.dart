import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/print_shack_page.dart';

void main() {
  testWidgets('PrintShackPage renders correctly', (WidgetTester tester) async {
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
          builder: (context, state) => const PrintShackPage(),
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
    expect(find.byType(PrintShackPage), findsOneWidget);
  });

  testWidgets('PrintShackPage has customization form', (WidgetTester tester) async {
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
          builder: (context, state) => const PrintShackPage(),
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

    // Look for text input fields for 3 lines
    expect(find.text('Line 1'), findsOneWidget);
    expect(find.text('Line 2'), findsOneWidget);
    expect(find.text('Line 3'), findsOneWidget);
  });

  testWidgets('PrintShackPage has live preview section', (WidgetTester tester) async {
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
          builder: (context, state) => const PrintShackPage(),
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

    // Check for live preview section
    expect(find.text('Live Preview'), findsOneWidget);
  });

  testWidgets('PrintShackPage has Add to Cart button', (WidgetTester tester) async {
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
          builder: (context, state) => const PrintShackPage(),
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

    expect(find.text('ADD TO CART'), findsOneWidget);
  });
}
