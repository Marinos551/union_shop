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

  testWidgets('PrintShackPage can select different products', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Should show product options
    expect(find.text('T-Shirt'), findsOneWidget);
    expect(find.text('Hoodie'), findsOneWidget);
  });

  testWidgets('PrintShackPage typing updates preview', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Type in line 1
    final line1Field = find.widgetWithText(TextField, 'Enter text for line 1');
    await tester.enterText(line1Field, 'Hello');
    await tester.pumpAndSettle();

    // Preview should update
    expect(find.text('Hello'), findsWidgets);
  });

  testWidgets('PrintShackPage typing in all lines updates preview', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Type in all three lines
    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 1'), 'Line One');
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 2'), 'Line Two');
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 3'), 'Line Three');
    await tester.pumpAndSettle();

    // All lines should appear
    expect(find.text('Line One'), findsWidgets);
    expect(find.text('Line Two'), findsWidgets);
    expect(find.text('Line Three'), findsWidgets);
  });

  testWidgets('PrintShackPage shows empty preview message initially', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    expect(find.text('Type to see preview'), findsOneWidget);
  });

  testWidgets('PrintShackPage can change color', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Find and tap a color chip (should have multiple colors)
    final colorChips = find.byType(ChoiceChip);
    expect(colorChips, findsWidgets);
  });

  testWidgets('PrintShackPage can increase quantity', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    // Find and scroll to the increase button
    final addButton = find.byIcon(Icons.add).first;
    await tester.ensureVisible(addButton);
    await tester.pumpAndSettle();
    
    // Tap increase button
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Quantity should increase to 2
    expect(find.text('2'), findsWidgets);
  });

  testWidgets('PrintShackPage can decrease quantity', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // First increase to 2
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();

    // Then decrease
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pumpAndSettle();

    expect(find.text('1'), findsWidgets);
  });

  testWidgets('PrintShackPage shows error when adding without text', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    // Scroll to and tap the ADD TO CART button
    final addToCartButton = find.text('ADD TO CART');
    await tester.ensureVisible(addToCartButton);
    await tester.pumpAndSettle();
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();

    // Should show error message
    expect(find.text('Please enter text on at least one line'), findsOneWidget);
  });

  testWidgets('PrintShackPage adds to cart with text', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
        GoRoute(path: '/cart', builder: (context, state) => const Scaffold(body: Text('Cart Page'))),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Enter text
    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 1'), 'Custom Text');
    await tester.pumpAndSettle();

    // Add to cart
    await tester.tap(find.text('ADD TO CART'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Added'), findsOneWidget);
  });

  testWidgets('PrintShackPage snackbar has VIEW CART action', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
        GoRoute(path: '/cart', builder: (context, state) => const Scaffold(body: Text('Cart Page'))),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 1'), 'Test');
    await tester.pumpAndSettle();

    await tester.tap(find.text('ADD TO CART'));
    await tester.pumpAndSettle();

    expect(find.text('VIEW CART'), findsOneWidget);
  });

  testWidgets('PrintShackPage VIEW CART navigates to cart', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
        GoRoute(path: '/cart', builder: (context, state) => const Scaffold(body: Text('Cart Page'))),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 1'), 'Test');
    await tester.pumpAndSettle();

    await tester.tap(find.text('ADD TO CART'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('VIEW CART'));
    await tester.pumpAndSettle();

    expect(find.text('Cart Page'), findsOneWidget);
  });

  testWidgets('PrintShackPage shows price calculation', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    expect(find.text('Price per item:'), findsOneWidget);
    expect(find.text('Total:'), findsOneWidget);
  });

  testWidgets('PrintShackPage mobile layout shows stacked', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    expect(find.byType(PrintShackPage), findsOneWidget);
    expect(find.text('Live Preview'), findsOneWidget);
  });

  testWidgets('PrintShackPage can switch products', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Enter text first
    await tester.enterText(find.widgetWithText(TextField, 'Enter text for line 1'), 'Test Text');
    await tester.pumpAndSettle();

    // Switch to hoodie
    await tester.tap(find.text('Hoodie'));
    await tester.pumpAndSettle();

    // Text should be cleared
    final textFields = find.byType(TextField);
    final firstTextField = tester.widget<TextField>(textFields.first);
    expect(firstTextField.controller?.text ?? '', isEmpty);
  });

  testWidgets('PrintShackPage quantity cannot go below 1', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    // Find the remove button and scroll to it
    final removeButtonFinder = find.ancestor(
      of: find.byIcon(Icons.remove),
      matching: find.byType(IconButton),
    ).first;
    
    await tester.ensureVisible(removeButtonFinder);
    await tester.pumpAndSettle();
    
    // Check that the button is disabled (onPressed is null)
    final button = tester.widget<IconButton>(removeButtonFinder);
    expect(button.onPressed, isNull); // Should be disabled when quantity is 1
  });

  testWidgets('PrintShackPage quantity cannot go above 10', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();

    // Find the add button
    final addButtonFinder = find.ancestor(
      of: find.byIcon(Icons.add),
      matching: find.byType(IconButton),
    ).first;
    
    await tester.ensureVisible(addButtonFinder);
    await tester.pumpAndSettle();

    // Increase to 10 (currently at 1, so tap 9 times)
    for (int i = 1; i < 10; i++) {
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();
    }

    // Check that the button is now disabled (onPressed is null)
    final button = tester.widget<IconButton>(addButtonFinder);
    expect(button.onPressed, isNull); // Should be disabled when quantity is 10
  });

  testWidgets('PrintShackPage shows selected product with check icon', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    final cartService = CartService();
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PrintShackPage()),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    // Should have check icon for selected product
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
}
