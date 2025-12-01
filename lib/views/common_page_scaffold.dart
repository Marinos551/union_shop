import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';

/// A common scaffold widget that wraps pages with header and footer
/// and handles the search focus functionality
class CommonPageScaffold extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;

  const CommonPageScaffold({
    super.key,
    required this.children,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // Create a ValueNotifier to trigger search focus
    final ValueNotifier<bool> focusSearchNotifier = ValueNotifier<bool>(false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Header with focus notifier
              HeaderWidget(focusSearchNotifier: focusSearchNotifier),
              
              // Page content
              ...children,
              
              // Footer with focus notifier
              SizedBox(
                height: 260,
                child: FooterWidget(focusSearchNotifier: focusSearchNotifier),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
