import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/models/print_shack_model.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/models/cart_model.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({super.key});

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String _selectedProductId = 'tshirt';
  String _customText = '';
  String _selectedFont = 'Arial';
  String _selectedColor = 'Black';
  int _quantity = 1;
  final _textController = TextEditingController();

  PrintShackProduct get _currentProduct {
    return getPrintShackProductById(_selectedProductId);
  }

  @override
  void initState() {
    super.initState();
    _selectedFont = _currentProduct.availableFonts.first;
    _selectedColor = _currentProduct.availableColors.first;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _updateProduct(String productId) {
    setState(() {
      _selectedProductId = productId;
      _customText = '';
      _textController.clear();
      _selectedFont = _currentProduct.availableFonts.first;
      _selectedColor = _currentProduct.availableColors.first;
      _quantity = 1;
    });
  }

  void _addToCart() {
    if (_customText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter custom text'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final customization = PrintShackCustomization(
      productId: _selectedProductId,
      customText: _customText,
      selectedFont: _selectedFont,
      selectedColor: _selectedColor,
      quantity: _quantity,
    );

    final cartItem = CartItem(
      productId: 'print_shack_${_selectedProductId}_${DateTime.now().millisecondsSinceEpoch}',
      productName: '${_currentProduct.name} - Custom Print',
      price: customization.calculatePrice(_currentProduct),
      imageUrl: 'assets/images/print_shack.png',
      quantity: 1,
      selectedSize: 'Custom: $_customText',
      selectedColor: _selectedColor,
    );

    CartService().addToCart(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${_currentProduct.name} to cart!'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'VIEW CART',
          textColor: Colors.white,
          onPressed: () {
            context.go('/cart');
          },
        ),
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

            // Back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF4d2963)),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                  tooltip: 'Go back',
                ),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 32 : 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 800;
                  
                  if (isWideScreen) {
                    // Desktop: Side-by-side layout
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Form Section
                        Expanded(
                          flex: 1,
                          child: _buildPrintShackForm(),
                        ),
                        const SizedBox(width: 40),
                        // Preview Section
                        Expanded(
                          flex: 1,
                          child: _buildPrintShackPreview(),
                        ),
                      ],
                    );
                  } else {
                    // Mobile: Stacked layout
                    return Column(
                      children: [
                        _buildPrintShackForm(),
                        const SizedBox(height: 32),
                        _buildPrintShackPreview(),
                      ],
                    );
                  }
                },
              ),
            ),

            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSelection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Product', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...printShackProducts.map((product) {
            final isSelected = product.id == _selectedProductId;
            return GestureDetector(
              onTap: () => _updateProduct(product.id),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepPurple[50] : Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name, style: TextStyle(fontSize: 18, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                        const SizedBox(height: 4),
                        Text('\$${product.basePrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                      ],
                    ),
                    if (isSelected) const Icon(Icons.check_circle, color: Colors.deepPurple),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPrintShackForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Print Shack - Personalize Your Item',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Create custom printed items with your own text',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 32),
        _buildProductSelection(),
        const SizedBox(height: 24),
        _buildCustomizationForm(),
      ],
    );
  }

  Widget _buildPrintShackPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Live Preview',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey[300]!, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              _customText,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _getColorFromString(_selectedColor),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Price per item:'),
                  Text('\$${_currentProduct.basePrice.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('Quantity:'), Text('$_quantity')],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    '\$${(_currentProduct.basePrice * _quantity).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _addToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('ADD TO CART', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomizationForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Customize Your Item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          const Text('Custom Text', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _textController,
            maxLength: _currentProduct.maxTextLength,
            decoration: InputDecoration(
              hintText: 'Enter your custom text',
              border: const OutlineInputBorder(),
              counterText: '${_customText.length}/${_currentProduct.maxTextLength}',
            ),
            onChanged: (value) => setState(() => _customText = value),
          ),
          const SizedBox(height: 24),
          const Text('Font Style', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _currentProduct.availableFonts.map((font) {
              final isSelected = font == _selectedFont;
              return ChoiceChip(
                label: Text(font),
                selected: isSelected,
                selectedColor: Colors.deepPurple,
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                onSelected: (selected) {
                  if (selected) setState(() => _selectedFont = font);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text('Text Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _currentProduct.availableColors.map((color) {
              final isSelected = color == _selectedColor;
              return ChoiceChip(
                label: Text(color),
                selected: isSelected,
                selectedColor: Colors.deepPurple,
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                onSelected: (selected) {
                  if (selected) setState(() => _selectedColor = color);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(backgroundColor: Colors.grey[200]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('$_quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              IconButton(
                onPressed: () => setState(() => _quantity++),
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(backgroundColor: Colors.grey[200]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        
        // Font Selection
        const Text(
          '3. Choose Font',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: _currentProduct.availableFonts.map((font) {
            return ChoiceChip(
              label: Text(font),
              selected: _selectedFont == font,
              onSelected: (selected) => setState(() => _selectedFont = font),
            );
          }).toList(),
        ),

        const SizedBox(height: 24),

        // Color Selection
        const Text(
          '4. Choose Color',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: _currentProduct.availableColors.map((color) {
            return ChoiceChip(
              label: Text(color),
              selected: _selectedColor == color,
              onSelected: (selected) => setState(() => _selectedColor = color),
            );
          }).toList(),
        ),

        const SizedBox(height: 24),

        // Quantity Selector
        const Text(
          '5. Quantity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
            ),
            Text(
              '$_quantity',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _quantity < 10 ? () => setState(() => _quantity++) : null,
            ),
          ],
        ),

        // Add to Cart Button
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
            ),
            onPressed: _customText.isEmpty ? null : () {
              final customization = PrintShackCustomization(
                productId: _selectedProductId,
                customText: _customText,
                selectedFont: _selectedFont,
                selectedColor: _selectedColor,
                quantity: _quantity,
              );
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added "$_customText" to cart!'),
                  backgroundColor: const Color(0xFF4d2963),
                ),
              );
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'navy':
        return Colors.indigo;
      case 'grey':
      case 'gray':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}
