import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/footer_widget.dart';
import 'package:union_shop/collections_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      routes: {
        '/about': (context) => const AboutPage(),
        // removed '/product' because ProductPage is navigated using MaterialPageRoute with custom args
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fix: return to the first route instead of pushing a named '/'
  void navigateToHome(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'Union Shop',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/about');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            SizedBox(
              height: 400,
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
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Welcome to the Union Shop',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width < 400 ? 24 : 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Official merch, gifts, and essentials for Portsmouth students.",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width < 400 ? 16 : 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6A1B9A),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Featured Categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.local_mall_outlined, size: 32, color: Colors.deepPurple),
                      SizedBox(height: 8),
                      Text("Clothing", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.emoji_events_outlined, size: 32, color: Colors.deepPurple),
                      SizedBox(height: 8),
                      Text("Merch", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.school_outlined, size: 32, color: Colors.deepPurple),
                      SizedBox(height: 8),
                      Text("Accessories", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                  crossAxisSpacing: MediaQuery.of(context).size.width > 600 ? 16 : 12,
                  mainAxisSpacing: MediaQuery.of(context).size.width > 600 ? 24 : 20,
                  children: const [
                    ProductCard(
                      title: 'University Hoodie',
                      price: '£39.99',
                      imageUrl: 'https://imgs.search.brave.com/17CbSojjUr5UKrQgHGAwDIqo2PSUw8-RRGKSaZq5Di8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb3J0/ZWl6c3RvcmUuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIz/LzA0L0NvcnRlaXot/QWxjYXRyYXotSG9v/ZGllLUJsYWNrLnBu/Zw',
                      description: 'Premium cotton blend hoodie with brushed interior, kangaroo pocket and double-layered hood.',
                    ),
                    ProductCard(
                      title: 'Laptop/Ipad bag',
                      price: '£25.00',
                      imageUrl: 'https://imgs.search.brave.com/cJeRnmjPSoNqk2W0i_QvXtWqh1ALN3IS7wO8eejPrMw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3N5c3RlbS9y/ZXNvdXJjZXMvdGh1/bWJuYWlscy8wNjUv/NDYxLzQxNC9zbWFs/bC90aGUtbGFwdG9w/LWJhZy1pcy1tYWRl/LWZyb20tZGFyay1i/cm93bi1sZWF0aGVy/LXBob3RvLmpwZw',
                      description: 'Compact and padded laptop bag with internal sleeve and organiser pockets.',
                    ),
                    ProductCard(
                      title: 'University hat',
                      price: '£9.00',
                      imageUrl: 'https://imgs.search.brave.com/7H7Liub0s8B_d3axOl56aAH70E_fIM0Lz4dTLM7iYj8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG5h/Lmx5c3RpdC5jb20v/MzAwLzM3NS90ci9w/aG90b3MvcnVlbGFs/YS80NGI3YzRkNC9n/dWNjaS1Ccm93bi1P/cmlnaW5hbC1HZy1X/ZWItQ2FudmFzLUJh/c2ViYWxsLUhhdC5q/cGVn',
                      description: 'Classic cap with embroidered university logo — adjustable fit.',
                    ),
                    ProductCard(
                      title: 'University pencil Case',
                      price: '£13.00',
                      imageUrl: 'https://imgs.search.brave.com/TrHleLQX3gbz9BISQnYdHTpx2CFaknXNcYKFpnXorkI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMz/NTU1MjQyMi9waG90/by9wZW5jaWxzLWlu/LWNhc2UtaXNvbGF0/ZWQtb24td2hpdGUt/YmFja2dyb3VuZC5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/MzJtVkU4MWRKMy1p/aXBfR1F0UGtETko3/a0dBNXNwdzJRa0lV/cXljRmd5ST0',
                      description: 'Durable canvas pencil case with zip closure and inner organisers.',
                    ),
                  ],
                ),
              ),
            ),

            // Footer: moved back into the scroll view
            SizedBox(
              height: 260, // adjust for your footer size
              child: const FooterWidget(),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              title: title,
              price: price,
              imageUrl: imageUrl,
              description: description,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                description,
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
}
