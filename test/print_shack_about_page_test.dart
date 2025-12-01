import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/print_shack_about_page.dart';

void main() {
  testWidgets('PrintShackAboutPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackAboutPage(),
      ),
    );

    // Verify the page renders
    expect(find.byType(PrintShackAboutPage), findsOneWidget);
  });

  testWidgets('PrintShackAboutPage displays information', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackAboutPage(),
      ),
    );

    // Check for text content
    expect(find.byType(Text), findsWidgets);
  });
}
