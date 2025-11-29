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

final List<PrintShackProduct> printShackProducts = [
  PrintShackProduct(
    id: 'tshirt',
    name: 'T-Shirt',
    basePrice: 15.99,
    availableFonts: ['Arial', 'Helvetica', 'Times New Roman', 'Comic Sans'],
    availableColors: ['Black', 'White', 'Red', 'Blue', 'Green'],
    maxTextLength: 30,
  ),
  PrintShackProduct(
    id: 'hoodie',
    name: 'Hoodie',
    basePrice: 29.99,
    availableFonts: ['Arial', 'Helvetica', 'Impact', 'Verdana'],
    availableColors: ['Black', 'Navy', 'Red', 'Grey'],
    maxTextLength: 25,
  ),
  PrintShackProduct(
    id: 'mug',
    name: 'Mug',
    basePrice: 8.99,
    availableFonts: ['Arial', 'Script', 'Comic Sans'],
    availableColors: ['Black', 'Blue', 'Red'],
    maxTextLength: 20,
  ),
];

PrintShackProduct getPrintShackProductById(String id) {
  return printShackProducts.firstWhere((product) => product.id == id);
}