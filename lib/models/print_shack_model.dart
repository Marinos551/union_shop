class PrintShackProduct {
  final String id;
  final String name;
  final double basePrice;
  final List<String> availableFonts;
  final List<String> availableColors;
  final int maxTextLength;

  const PrintShackProduct({
    required this.id,
    required this.name,
    required this.basePrice,
    required this.availableFonts,
    required this.availableColors,
    required this.maxTextLength,
  });
}

class PrintShackCustomization {
  final String productId;
  final String customText;
  final String selectedFont;
  final String selectedColor;
  final int quantity;

  const PrintShackCustomization({
    required this.productId,
    required this.customText,
    required this.selectedFont,
    required this.selectedColor,
    this.quantity = 1,
  });

  double calculatePrice(PrintShackProduct product) {
    return product.basePrice * quantity;
  }
}