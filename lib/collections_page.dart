import 'package:flutter/material.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/models/collection_model.dart';
import 'package:union_shop/data/collections_data.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

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
              Navigator.pushNamed(
                context,
                '/collection-products',
                arguments: collection.id, // Pass collection ID to next page
              );
            },
            child: Column(
              children: [
                Expanded( // Makes image take available space
                  child: Image.asset(
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
                        collection.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Slightly larger title
                        ),
                      ),
                      Text(
                        '${collection.productCount} items',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderWidget(),
            // Page Title
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore our curated collections',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Collections Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}