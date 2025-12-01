import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
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
import 'package:union_shop/purchase_history_page.dart';

void main() {
  runApp(const UnionShopApp());
}

// GoRouter configuration with deep linking support
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    // Home route
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    
    // About route
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
    
    // Auth route
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const AuthPage(),
    ),
    
    // Collections route
    GoRoute(
      path: '/collections',
      name: 'collections',
      builder: (context, state) => const CollectionsPage(),
    ),
    
    // Collection products route with collection ID parameter
    GoRoute(
      path: '/collection/:collectionId',
      name: 'collection-products',
      builder: (context, state) {
        final collectionId = state.pathParameters['collectionId'] ?? 'clothing';
        // Pass collectionId as extra data that can be retrieved in the page
        return CollectionProductsPage(
          key: ValueKey(collectionId),
        );
      },
      routes: [
        // Nested product route under collection
        GoRoute(
          path: 'product/:productId',
          name: 'collection-product',
          builder: (context, state) {
            final productId = state.pathParameters['productId'] ?? 'p1';
            return ProductPage(
              key: ValueKey(productId),
            );
          },
        ),
      ],
    ),
    
    // Sale route
    GoRoute(
      path: '/sale',
      name: 'sale',
      builder: (context, state) => const SaleCollectionPage(),
      routes: [
        // Nested product route under sale
        GoRoute(
          path: 'product/:productId',
          name: 'sale-product',
          builder: (context, state) {
            final productId = state.pathParameters['productId'] ?? 'p1';
            return ProductPage(
              key: ValueKey(productId),
            );
          },
        ),
      ],
    ),
    
    // Standalone product route (for search results)
    GoRoute(
      path: '/product/:productId',
      name: 'product',
      builder: (context, state) {
        final productId = state.pathParameters['productId'] ?? 'p1';
        return ProductPage(
          key: ValueKey(productId),
        );
      },
    ),
    
    // Cart route
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartPage(),
    ),
    
    // Purchase history route
    GoRoute(
      path: '/purchase-history',
      name: 'purchase-history',
      builder: (context, state) => const PurchaseHistoryPage(),
    ),
    
    // Print Shack route
    GoRoute(
      path: '/print-shack',
      name: 'print-shack',
      builder: (context, state) => const PrintShackPage(),
    ),
    
    // Print Shack About route
    GoRoute(
      path: '/print-shack-about',
      name: 'print-shack-about',
      builder: (context, state) => const PrintShackAboutPage(),
    ),
  ],
  // Error page for unknown routes
  errorBuilder: (context, state) => const HomeScreen(),
);

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartService(),
      child: MaterialApp.router(
        title: 'Union Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        ),
        routerConfig: _router,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                                  context.go('/collections');
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
                        onTap: () => context.go('/collections'),
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
                        onTap: () => context.go('/sale'),
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
                        onTap: () => context.go('/cart'),
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
        context.go('/product/${product.id}');
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
