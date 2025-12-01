import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/models/collection_model.dart';
import 'package:union_shop/data/collections_data.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String _sortBy = 'Popular';
  String _filterCategory = 'All Categories';
  String _filterItemCount = 'All';
  int _currentPage = 0;
  final int _collectionsPerPage = 6;

  List<Collection> _getSortedAndFilteredCollections() {
    List<Collection> filtered = List.from(collections);

    // Apply category filter (based on what products are in the collection)
    // For simplicity, we'll keep all collections for "All Categories"
    // In a real app, you might want to filter based on collection metadata
    
    // Apply item count filter
    if (_filterItemCount == 'Under 5 items') {
      filtered = filtered.where((c) => c.productCount < 5).toList();
    } else if (_filterItemCount == '5-10 items') {
      filtered = filtered.where((c) => c.productCount >= 5 && c.productCount <= 10).toList();
    } else if (_filterItemCount == 'Over 10 items') {
      filtered = filtered.where((c) => c.productCount > 10).toList();
    }

    // Apply sorting
    switch (_sortBy) {
      case 'Item Count: Low to High':
        filtered.sort((a, b) => a.productCount.compareTo(b.productCount));
        break;
      case 'Item Count: High to Low':
        filtered.sort((a, b) => b.productCount.compareTo(a.productCount));
        break;
      case 'Name: A-Z':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      // 'Popular' and 'Newest' use default order
      default:
        break;
    }

    return filtered;
  }

  List<Collection> _getPaginatedCollections(List<Collection> collectionsToShow) {
    final startIndex = _currentPage * _collectionsPerPage;
    if (startIndex >= collectionsToShow.length) {
      return [];
    }
    
    final endIndex = startIndex + _collectionsPerPage;
    return collectionsToShow.sublist(
      startIndex, 
      endIndex > collectionsToShow.length ? collectionsToShow.length : endIndex
    );
  }

  int _getTotalPages(int totalCollections) {
    return (totalCollections / _collectionsPerPage).ceil();
  }

  Widget _buildPaginationControls(int totalCollections) {
    final totalPages = _getTotalPages(totalCollections);
    
    if (totalPages <= 1) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _currentPage > 0 ? () {
              setState(() => _currentPage--);
            } : null,
            color: _currentPage > 0 ? const Color(0xFF4d2963) : Colors.grey,
          ),
          Text(
            'Page ${_currentPage + 1} of $totalPages',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _currentPage < totalPages - 1 ? () {
              setState(() => _currentPage++);
            } : null,
            color: _currentPage < totalPages - 1 ? const Color(0xFF4d2963) : Colors.grey,
          ),
        ],
      ),
    );
  }

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
              context.go('/collection/${collection.id}');
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
    final List<Collection> displayedCollections = _getSortedAndFilteredCollections();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            HeaderWidget(key: headerKey),
            // Page Title
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF4d2963)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: 'Go back',
                    ),
                  ),
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
            // Sort/Filter Controls
            Container(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Sort:'),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _sortBy,
                        items: const [
                          DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                          DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                          DropdownMenuItem(value: 'Item Count: Low to High', child: Text('Item Count: Low to High')),
                          DropdownMenuItem(value: 'Item Count: High to Low', child: Text('Item Count: High to Low')),
                          DropdownMenuItem(value: 'Name: A-Z', child: Text('Name: A-Z')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _sortBy = value;
                              _currentPage = 0;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Item Count:'),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _filterItemCount,
                        items: const [
                          DropdownMenuItem(value: 'All', child: Text('All')),
                          DropdownMenuItem(value: 'Under 5 items', child: Text('Under 5 items')),
                          DropdownMenuItem(value: '5-10 items', child: Text('5-10 items')),
                          DropdownMenuItem(value: 'Over 10 items', child: Text('Over 10 items')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _filterItemCount = value;
                              _currentPage = 0;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Collection Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${displayedCollections.length} ${displayedCollections.length == 1 ? 'collection' : 'collections'}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            // Collections Grid with Pagination
            displayedCollections.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No collections found',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      // Pagination controls at top
                      _buildPaginationControls(displayedCollections.length),
                      // Collections Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: _getPaginatedCollections(displayedCollections).length,
                        itemBuilder: (context, index) {
                          final paginatedCollections = _getPaginatedCollections(displayedCollections);
                          return _buildCollectionCard(paginatedCollections[index]);
                        },
                      ),
                      // Pagination controls at bottom
                      _buildPaginationControls(displayedCollections.length),
                    ],
                  ),
            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}