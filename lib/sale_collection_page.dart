import 'package:flutter/material.dart';

class SaleProduct {
  final String title;
  final String originalPrice;
  final String salePrice;
  final String imageUrl;
  final String category;
  final int discountPercent;

  SaleProduct({
    required this.title,
    required this.originalPrice,
    required this.salePrice,
    required this.imageUrl,
    required this.category,
    required this.discountPercent,
  });
}

// Sample sale products data
final List<SaleProduct> saleProducts = [
  SaleProduct(
    title: 'Classic University Hoodie',
    originalPrice: '£45.00',
    salePrice: '£29.99',
    imageUrl:
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
    category: 'Clothing',
    discountPercent: 33,
  ),
  SaleProduct(
    title: 'Student Backpack',
    originalPrice: '£35.00',
    salePrice: '£19.99',
    imageUrl:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    category: 'Accessories',
    discountPercent: 43,
  ),
];