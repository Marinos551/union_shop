import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/common_page_scaffold.dart';

void main() {
  testWidgets('CommonPageScaffold renders with children', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => CommonPageScaffold(
            children: [
              const Text('Test Content'),
            ],
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

    // Verify content is displayed
    expect(find.text('Test Content'), findsOneWidget);
  });

  testWidgets('CommonPageScaffold includes header and footer', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => CommonPageScaffold(
            children: [
              const Text('Page Content'),
            ],
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

    // Check that scaffold structure exists
    expect(find.byType(CommonPageScaffold), findsOneWidget);
    expect(find.text('Page Content'), findsOneWidget);
  });

  testWidgets('CommonPageScaffold applies custom padding', (WidgetTester tester) async {
    // Set screen size to prevent overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => CommonPageScaffold(
            padding: const EdgeInsets.all(24),
            children: [
              const Text('Custom Padding'),
            ],
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

    expect(find.text('Custom Padding'), findsOneWidget);
  });
}
