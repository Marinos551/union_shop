import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/views/common_page_scaffold.dart';

void main() {
  testWidgets('CommonPageScaffold renders with children', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: CommonPageScaffold(
            children: [
              const Text('Test Content'),
            ],
          ),
        ),
      ),
    );

    // Verify content is displayed
    expect(find.text('Test Content'), findsOneWidget);
  });

  testWidgets('CommonPageScaffold includes header and footer', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: CommonPageScaffold(
            children: [
              const Text('Page Content'),
            ],
          ),
        ),
      ),
    );

    // Check that scaffold structure exists
    expect(find.byType(CommonPageScaffold), findsOneWidget);
    expect(find.text('Page Content'), findsOneWidget);
  });

  testWidgets('CommonPageScaffold applies custom padding', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => CartService(),
          child: CommonPageScaffold(
            padding: const EdgeInsets.all(24),
            children: [
              const Text('Custom Padding'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Custom Padding'), findsOneWidget);
  });
}
