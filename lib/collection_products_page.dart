import 'package:flutter/material.dart';

class CollectionProductsPage extends StatelessWidget {
  const CollectionProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('Collection Products Page'),
      ),
    );
  }
}
