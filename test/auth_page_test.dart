import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/auth_page.dart';

void main() {
  testWidgets('AuthPage displays login and signup forms', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AuthPage(),
      ),
    );

    // Verify the page renders
    expect(find.byType(AuthPage), findsOneWidget);
    
    // Check for common auth elements
    expect(find.byType(TextField), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
  });

  testWidgets('AuthPage has email and password fields', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AuthPage(),
      ),
    );

    // Look for text input fields
    expect(find.byType(TextField), findsAtLeastNWidgets(2));
  });
}
