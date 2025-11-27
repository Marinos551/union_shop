class Collection {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int productCount;
  final List<String> tags; // e.g., ['clothing', 'winter', 'essential']

  const Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.productCount,
    required this.tags,
  });
}
