import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';

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
      imageUrl: 'assets/images/newarrivals.webp',
      itemCount: 12,
    ),
    Collection(
      title: 'Bestsellers',
      imageUrl: 'assets/images/bestsellers.webp',
      itemCount: 8,
    ),
    Collection(
      title: 'Sale Items',
      imageUrl: 'assets/images/sale.webp',
      itemCount: 15,
    ),
    Collection(
      title: 'Clothing',
      imageUrl: 'assets/images/clothing.webp',
      itemCount: 24,
    ),
    Collection(
      title: 'Accessories',
      imageUrl: 'assets/images/accesories.webp',
      itemCount: 18,
    ),
    Collection(
      title: 'Electronics',
      imageUrl: 'assets/images/electonics.webp',
      itemCount: 10,
    ),
    Collection(
      title: 'Stationery',
      imageUrl: 'assets/images/stationery.webp',
      itemCount: 22,
    ),
  ];

  Widget _buildCollectionCard(Collection collection) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Builder(
        builder: (BuildContext context) {
          return InkWell(
            borderRadius: BorderRadius.circular(8), // Match card corners
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening ${collection.title}')), // Temporary feedback
              );
            },
            child: Column(
              children: [
                Expanded( // Makes image take available space
                  child: Image.network(
                    collection.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child; // Image loaded
                      return const Center(child: CircularProgressIndicator()); // Show spinner
                    },
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly larger title
                        ),
                      ),
                      Text(
                        '${collection.itemCount} items',
                        style: TextStyle(
                          color: Colors.grey[600], // Subtle color for secondary info
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          const HeaderWidget(),
          // Collections Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2, // 3 cols on tablet, 2 on phone
                crossAxisSpacing: 16, // Space between columns
                mainAxisSpacing: 16, // Space between rows
                childAspectRatio: 0.8, // Better card proportions
              ),
              itemCount: collections.length, // How many items to show
              itemBuilder: (context, index) {
                return _buildCollectionCard(collections[index]); // Build each card
              },
            ),
          ),
        ],
      ),
    );
  }
}