import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_collection_page.dart';

void main() {
  group('SaleCollectionPage Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: SaleCollectionPage(),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check AppBar title
      expect(find.text('Sale Items'), findsWidgets);
    });

    testWidgets('should display SALE promotional header', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check promotional header
      expect(find.text('SALE'), findsOneWidget);
      expect(
        find.text('Limited time offers on selected items'),
        findsOneWidget,
      );
    });

    testWidgets('should display sale product count', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product count (should be 5 sale products)
      expect(find.text('5 sale items'), findsOneWidget);
    });

    testWidgets('should display sale product cards', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Card widgets are present
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display sale product titles', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product titles
      expect(find.text('Classic University Hoodie'), findsOneWidget);
      expect(find.text('Student Backpack'), findsOneWidget);
      expect(find.text('University T-Shirt'), findsOneWidget);
      expect(find.text('Student Water Bottle'), findsOneWidget);
      expect(find.text('University Notebook Set'), findsOneWidget);
    });

    testWidgets('should display sale and original prices', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check sale prices
      expect(find.text('£29.99'), findsOneWidget);
      expect(find.text('£19.99'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£9.99'), findsOneWidget);
      expect(find.text('£8.99'), findsOneWidget);

      // Check original prices
      expect(find.text('£45.00'), findsOneWidget);
      expect(find.text('£35.00'), findsOneWidget);
      expect(find.text('£24.99'), findsOneWidget);
      expect(find.text('£18.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
    });

    testWidgets('should display discount percentage badges', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check discount badges
      expect(find.text('33% OFF'), findsOneWidget);
      expect(find.text('43% OFF'), findsOneWidget);
      expect(find.text('40% OFF'), findsWidgets); // Two products with 40% off
      expect(find.text('44% OFF'), findsOneWidget);
    });

    testWidgets('should display product categories', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check product categories
      expect(find.text('Clothing'), findsWidgets);
      expect(find.text('Accessories'), findsWidgets);
      expect(find.text('Stationery'), findsOneWidget);
    });

    testWidgets('should use GridView for product layout', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should display product with highest discount', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Student Water Bottle has highest discount at 44%
      expect(find.text('44% OFF'), findsOneWidget);
    });

    testWidgets('should have scrollable product grid', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Verify grid is scrollable by checking for GridView
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);
    });
  });
}
