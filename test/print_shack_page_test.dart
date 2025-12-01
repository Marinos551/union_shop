import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/print_shack_page.dart';

void main() {
  testWidgets('PrintShackPage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackPage(),
      ),
    );

    // Verify the page renders
    expect(find.byType(PrintShackPage), findsOneWidget);
  });

  testWidgets('PrintShackPage has customization form', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackPage(),
      ),
    );

    // Look for text input fields for 3 lines
    expect(find.text('Line 1'), findsOneWidget);
    expect(find.text('Line 2'), findsOneWidget);
    expect(find.text('Line 3'), findsOneWidget);
  });

  testWidgets('PrintShackPage has live preview section', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackPage(),
      ),
    );

    // Check for live preview section
    expect(find.text('Live Preview'), findsOneWidget);
  });

  testWidgets('PrintShackPage has Add to Cart button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PrintShackPage(),
      ),
    );

    expect(find.text('ADD TO CART'), findsOneWidget);
  });
}
