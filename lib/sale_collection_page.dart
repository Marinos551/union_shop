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