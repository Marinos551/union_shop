import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/models/cart_service.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/header_widget.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/collection_products_page.dart';
import 'package:union_shop/sale_collection_page.dart';
import 'package:union_shop/data/collections_data.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/models/cart_page.dart';
import 'package:union_shop/print_shack_page.dart';
import 'package:union_shop/print_shack_about_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp(
        title: 'Union Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/about': (context) => const AboutPage(),
          '/auth': (context) => const AuthPage(),
          '/collections': (context) => const CollectionsPage(),
          '/collection-products': (context) => const CollectionProductsPage(),
          '/sale': (context) => const SaleCollectionPage(),
          '/cart': (context) => const CartPage(),
          '/print-shack': (context) => const PrintShackPage(),
          '/print-shack-about': (context) => const PrintShackAboutPage(),
          // removed '/product' because ProductPage is navigated using MaterialPageRoute with custom args
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
            // Header
            const HeaderWidget(),

            // Hero Section - Responsive
            LayoutBuilder(
              builder: (context, constraints) {
                final isWideScreen = constraints.maxWidth > 600;
                final heroHeight = isWideScreen ? 500.0 : 400.0;
                final titleFontSize = isWideScreen ? 36.0 : 28.0;
                final subtitleFontSize = isWideScreen ? 22.0 : 18.0;

                return SizedBox(
                  height: heroHeight,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                      // Content overlay
                      Positioned(
                        left: isWideScreen ? 80 : 24,
                        right: isWideScreen ? 80 : 24,
                        top: isWideScreen ? 120 : 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Welcome to the Union Shop',
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Official merch, gifts, and essentials for Portsmouth students.",
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: isWideScreen ? 300 : double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/collections');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6A1B9A),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  'BROWSE PRODUCTS',
                                  style: TextStyle(
                                    fontSize: isWideScreen ? 16 : 14,
                                    letterSpacing: 1,
                                  ),
                                ),
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

            // Featured Categories - Responsive
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: MediaQuery.of(context).size.width > 600 ? 60 : 16,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 600;
                  final iconSize = isWideScreen ? 40.0 : 32.0;
                  final fontSize = isWideScreen ? 16.0 : 14.0;
                  
                  return Wrap(
                    spacing: isWideScreen ? 40 : 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/collections'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.school_outlined, size: iconSize, color: Colors.deepPurple),
                            const SizedBox(height: 8),
                            Text("Collections", style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/sale'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.local_offer_outlined, size: iconSize, color: Colors.deepPurple),
                            const SizedBox(height: 8),
                            Text("Sale Items", style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/cart'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.shopping_cart_outlined, size: iconSize, color: Colors.deepPurple),
                            const SizedBox(height: 8),
                            Text("Cart", style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Products Section - Featured Best Sellers
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Text(
                        'FEATURED PRODUCTS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4d2963),
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                        crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 16 : 12,
                        mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 24 : 20,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: getProductsByCollection('bestsellers').take(4).length,
                      itemBuilder: (context, index) {
                        final product = getProductsByCollection('bestsellers').elementAt(index);
                        return ProductCard(product: product);
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Footer: moved back into the scroll view
            const SizedBox(
              height: 260, // adjust for your footer size
              child: FooterWidget(),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
            settings: RouteSettings(
              arguments: {'productId': product.id},
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
                // Sale Badge
                if (product.isOnSale)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${product.discountPercentage}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                // Stock Badge
                if (!product.inStock)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'OUT OF STOCK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              if (product.isOnSale)
                Row(
                  children: [
                    Text(
                      '£${product.salePrice!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  '£${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                product.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
            settings: RouteSettings(
              arguments: {'productId': product.id},
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          if (product.isOnSale)
            Row(
              children: [
                Text(
                  '£${product.salePrice!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '£${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            )
          else
            Text(
              '£${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            product.description,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
