import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer_widget.dart';

void main() {
  group('FooterWidget Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: Scaffold(
          body: FooterWidget(),
        ),
      );
    }

    testWidgets('should display main footer text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check main footer text
      expect(find.text('Union Shop - Your Campus Store'), findsOneWidget);
    });

    testWidgets('should display Quick Links heading', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check Quick Links heading
      expect(find.text('Quick Links'), findsOneWidget);
    });

    testWidgets('should display primary navigation links', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check primary navigation links
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Products'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('should display contact links', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check contact links
      expect(find.text('Contact Us'), findsOneWidget);
      expect(find.text('Support'), findsOneWidget);
      expect(find.text('FAQ'), findsOneWidget);
    });

    testWidgets('should display social media icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check social media icons
      expect(find.byIcon(Icons.facebook), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    });

    testWidgets('should display copyright text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check copyright text
      expect(find.text('© 2025 Union Shop. All rights reserved.'), findsOneWidget);
    });

    testWidgets('should be scrollable', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Verify the footer is scrollable by finding SingleChildScrollView
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should have proper layout structure', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Container and Column are present
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('should center align content', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Row widgets are used for center alignment
      expect(find.byType(Row), findsWidgets);
    });
  });
}
