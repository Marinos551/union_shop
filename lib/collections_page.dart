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

  Widget _buildCollectionCard(Collection collection) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            collection.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text(collection.title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963), // Matches your app theme
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 16, // Space between columns
          mainAxisSpacing: 16, // Space between rows
        ),
        itemCount: collections.length, // How many items to show
        itemBuilder: (context, index) {
          return _buildCollectionCard(collections[index]); // Build each card
        },
      ),
    );
  }
}