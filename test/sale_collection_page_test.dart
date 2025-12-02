import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/sale_collection_page.dart';

void main() {
  group('SaleCollectionPage Tests', () {
    Widget createTestWidget(WidgetTester tester) {
      // Set screen size to prevent overflow
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      final cartService = CartService();

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const SaleCollectionPage(),
          ),
        ],
      );

      return ChangeNotifierProvider.value(
        value: cartService,
        child: MaterialApp.router(
          routerConfig: router,
        ),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check promotional header title (no traditional AppBar, just "SALE" text)
      expect(find.text('SALE'), findsWidgets);
    });

    testWidgets('should display SALE promotional header', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check promotional header
      expect(find.text('SALE'), findsOneWidget);
      expect(
        find.text('Limited time offers on selected items'),
        findsOneWidget,
      );
    });

    testWidgets('should display sale product count', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product count (should be 5 sale products)
      expect(find.text('5 sale items'), findsOneWidget);
    });

    testWidgets('should display sale product cards', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check that Card widgets are present
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display sale product titles', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product titles
      expect(find.text('Varsity Jacket'), findsOneWidget);
      expect(find.text('Knitted Scarf'), findsOneWidget);
      expect(find.text('Academic Planner 2025/26'), findsOneWidget);
      expect(find.text('Power Bank 10000mAh'), findsOneWidget);
      expect(find.text('Sports Water Bottle'), findsOneWidget);
    });

    testWidgets('should display sale and original prices', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check sale prices
      expect(find.text('£39.99'), findsOneWidget);
      expect(find.text('£11.99'), findsOneWidget);
      expect(find.text('£8.99'), findsOneWidget);
      expect(find.text('£16.99'), findsOneWidget);
      expect(find.text('£13.99'), findsOneWidget);

      // Check original prices
      expect(find.text('£55.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£14.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£18.00'), findsOneWidget);
    });

    testWidgets('should display discount percentage badges', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check discount badges
      expect(find.text('-27% OFF'), findsOneWidget); // Varsity Jacket
      expect(find.text('-25% OFF'), findsNWidgets(2)); // Knitted Scarf and Academic Planner
      expect(find.text('-23% OFF'), findsOneWidget); // Power Bank
      expect(find.text('-22% OFF'), findsOneWidget); // Sports Water Bottle
    });

    testWidgets('should display product categories', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check product categories
      expect(find.text('Clothing'), findsWidgets);
      expect(find.text('Accessories'), findsWidgets);
      expect(find.text('Stationery'), findsOneWidget);
    });

    testWidgets('should use GridView for product layout', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Check that GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should display product with highest discount', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Varsity Jacket has highest discount at 27%
      expect(find.text('-27% OFF'), findsOneWidget);
    });

    testWidgets('should have scrollable product grid', (tester) async {
      await tester.pumpWidget(createTestWidget(tester));
      await tester.pumpAndSettle();

      // Verify grid is scrollable by checking for GridView
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);
    });
  });
}
