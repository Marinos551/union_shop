class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String collectionId; // Links product to its collection
  final List<String> sizes; // e.g., ['S', 'M', 'L', 'XL']
  final List<String> colors; // e.g., ['Black', 'White', 'Purple']
  final bool isOnSale;
  final double? salePrice;
  final int discountPercentage; // e.g., 20 for 20% off
  final String
      category; // 'Clothing', 'Accessories', 'Stationery', 'Electronics'
  final bool inStock;
  final int stockQuantity;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.collectionId,
    required this.sizes,
    required this.colors,
    required this.isOnSale,
    this.salePrice,
    required this.discountPercentage,
    required this.category,
    required this.inStock,
    required this.stockQuantity,
  });

  // Helper method to get the display price (sale price if on sale, regular price otherwise)
  double get displayPrice => isOnSale && salePrice != null ? salePrice! : price;

  // Helper method to check if product has multiple size options
  bool get hasMultipleSizes => sizes.isNotEmpty && sizes.length > 1;

  // Helper method to check if product has multiple color options
  bool get hasMultipleColors => colors.isNotEmpty && colors.length > 1;

  // Convert product name to URL-friendly slug
  String get slug {
    return name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '') // Remove special characters
        .replaceAll(RegExp(r'\s+'), '-') // Replace spaces with hyphens
        .replaceAll(RegExp(r'-+'), '-') // Replace multiple hyphens with single
        .trim();
  }

  // Static helper to find product by slug
  static Product? findBySlug(List<Product> products, String slug) {
    try {
      return products.firstWhere((product) => product.slug == slug);
    } catch (e) {
      return null;
    }
  }
}
