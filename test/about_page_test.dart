import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/about_page.dart';

void main() {
  group('AboutPage Tests', () {
    testWidgets('should display main heading', (tester) async {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AboutPage(),
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

      // Check main heading
      expect(find.text('About Union Shop'), findsOneWidget);
      
      // Reset the screen size
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('should display tagline text', (tester) async {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AboutPage(),
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

      // Check tagline
      expect(
        find.text(
          'Your trusted campus store for official university merchandise and essentials.',
        ),
        findsOneWidget,
      );
      
      // Reset the screen size
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('should display Our Story section', (tester) async {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AboutPage(),
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

      // Check Our Story heading
      expect(find.text('Our Story'), findsOneWidget);
      
      // Reset the screen size
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('should display Contact Us section', (tester) async {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AboutPage(),
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

      // Check Contact Us heading
      expect(find.text('Contact Us'), findsAtLeastNWidgets(1));
      
      // Reset the screen size
      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('should be scrollable', (tester) async {
      // Set a larger screen size to avoid layout overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      
      final cartService = CartService();
      
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AboutPage(),
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

      // Verify the page is scrollable by finding SingleChildScrollView
      expect(find.byType(SingleChildScrollView), findsWidgets);
      
      // Reset the screen size
      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}

