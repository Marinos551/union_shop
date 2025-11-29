import '../models/print_shack_model.dart';

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
