import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/auth_page.dart';

void main() {
  testWidgets('AuthPage displays login and signup forms', (WidgetTester tester) async {
    // Set a larger screen size to avoid layout overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    
    final cartService = CartService();
    final router = GoRouter(
      initialLocation: '/auth',
      routes: [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const AuthPage(),
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

    // Verify the page renders
    expect(find.byType(AuthPage), findsOneWidget);
    
    // Check for common auth elements
    expect(find.byType(TextField), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
    
    // Reset the screen size
    addTearDown(() => tester.view.resetPhysicalSize());
  });

  testWidgets('AuthPage has email and password fields', (WidgetTester tester) async {
    // Set a larger screen size to avoid layout overflow
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    
    final cartService = CartService();
    final router = GoRouter(
      initialLocation: '/auth',
      routes: [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const AuthPage(),
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

    // Look for text input fields
    expect(find.byType(TextField), findsAtLeastNWidgets(2));
    
    // Reset the screen size
    addTearDown(() => tester.view.resetPhysicalSize());
  });
}
