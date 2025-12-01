import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections_page.dart';

void main() {
  group('CollectionsPage Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: CollectionsPage(),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check AppBar title
      expect(find.text('Collections'), findsOneWidget);
    });

    testWidgets('should display collection cards', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Card widgets are present
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('should display New Arrivals collection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check New Arrivals collection
      expect(find.text('New Arrivals'), findsOneWidget);
      expect(find.text('12 items'), findsOneWidget);
    });

    testWidgets('should display Bestsellers collection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Bestsellers collection
      expect(find.text('Bestsellers'), findsOneWidget);
      expect(find.text('8 items'), findsOneWidget);
    });

    testWidgets('should display Sale Items collection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Sale Items collection
      expect(find.text('Sale Items'), findsOneWidget);
      expect(find.text('15 items'), findsOneWidget);
    });

    testWidgets('should display all seven collections', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check all collections are present (some may need scrolling)
      expect(find.text('Clothing'), findsOneWidget);
      expect(find.text('Accessories'), findsOneWidget);
      expect(find.text('Electronics'), findsOneWidget);
      
      // Scroll to see more collections
      await tester.drag(find.byType(GridView), const Offset(0, -300));
      await tester.pumpAndSettle();
      
      // Now check for Stationery
      expect(find.text('Stationery'), findsOneWidget);
    });

    testWidgets('should show snackbar when collection card is tapped',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Tap on the first collection card (New Arrivals)
      await tester.tap(find.text('New Arrivals'));
      await tester.pumpAndSettle();

      // Check that snackbar appears with correct message
      expect(find.text('Opening New Arrivals'), findsOneWidget);
    });

    testWidgets('should display correct item counts', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Verify item counts for different collections (visible ones)
      expect(find.text('24 items'), findsOneWidget); // Clothing
      expect(find.text('18 items'), findsOneWidget); // Accessories
      expect(find.text('10 items'), findsOneWidget); // Electronics
      
      // Scroll to see Stationery
      await tester.drag(find.byType(GridView), const Offset(0, -300));
      await tester.pumpAndSettle();
      
      // Check Stationery item count
      expect(find.text('22 items'), findsOneWidget); // Stationery
    });

    testWidgets('should use GridView for layout', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
