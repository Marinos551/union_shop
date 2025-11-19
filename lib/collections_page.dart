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
    Collection(
      title: 'Clothing',
      imageUrl: 'https://images.unsplash.com/photo-1485231183945-fffde7cb34e9?w=400',
      itemCount: 24,
    ),
    Collection(
      title: 'Accessories',
      imageUrl: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
      itemCount: 18,
    ),
    Collection(
      title: 'Electronics',
      imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
      itemCount: 10,
    ),
    Collection(
      title: 'Stationery',
      imageUrl: 'https://images.unsplash.com/photo-1586232702178-f044c5f4d4b7?w=400',
      itemCount: 22,
    ),
  ];

  Widget _buildCollectionCard(Collection collection) {
    return InkWell(
      onTap: () {
        // Handle collection tap - will implement in next commit
      },
      child: Card(
        elevation: 2, // Adds shadow
        child: Column(
          children: [
            Expanded( // Makes image take available space
              child: Image.network(
                collection.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported), // Show error icon
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    collection.title,
                    style: const TextStyle(fontWeight: FontWeight.bold), // Bold title
                  ),
                  Text('${collection.itemCount} items'), // Show count
                ],
              ),
            ),
          ],
        ),
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