import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_page.dart';

void main() {
  group('AboutPage Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: AboutPage(),
      );
    }

    testWidgets('should display AppBar with correct title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check AppBar title
      expect(find.text('About Us'), findsOneWidget);
    });

    testWidgets('should display main heading', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check main heading
      expect(find.text('About Union Shop'), findsOneWidget);
    });

    testWidgets('should display tagline text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check tagline
      expect(
        find.text(
          'Your trusted campus store for official university merchandise and essentials.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display Our Story section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Our Story heading
      expect(find.text('Our Story'), findsOneWidget);
      
      // Check story content
      expect(
        find.text(
          'Founded in 2010, Union Shop has been serving students with quality university merchandise and daily essentials.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display Contact Us section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Contact Us heading (there are 2: one in content, one in footer)
      expect(find.text('Contact Us'), findsWidgets);
      
      // Check contact information
      expect(
        find.text(
          'Email: support@unionshop.com\nPhone: +44 123 456 7890\nLocation: Student Union Building, Campus',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display footer widget', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that FooterWidget is present
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.text('Union Shop - Your Campus Store'), findsOneWidget);
    });

    testWidgets('should be scrollable', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Verify the page is scrollable by finding SingleChildScrollView
      expect(find.byType(SingleChildScrollView), findsWidgets);
    });
  });
}
