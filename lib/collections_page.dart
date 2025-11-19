import 'package:flutter/material.dart';

class Collection {
  final String title;
  final String imageUrl;
  final int itemCount;

  Collection({
    required this.title,
    required this.imageUrl,
    required this.itemCount,
  });
}

class CollectionsPage extends StatelessWidget {
   CollectionsPage({super.key});

  final List<Collection> collections = [
    Collection(
      title: 'New Arrivals',
      imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400',
      itemCount: 12,
    ),
    Collection(
      title: 'Bestsellers',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      itemCount: 8,
    ),
    Collection(
      title: 'Sale Items',
      imageUrl: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=400',
      itemCount: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963), // Matches your app theme
      ),
      body: const Center(
        child: Text('Collections Page'), // Basic placeholder
      ),
    );
  }
}