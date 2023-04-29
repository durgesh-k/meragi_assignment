import 'package:flutter/foundation.dart';

class Product {
  final String? price;
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final String? image;
  final String? rate;
  final String? count;

  Product({
    @required this.price,
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.image,
    @required this.rate,
    @required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'].toString() as String,
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rate: json['rating']['rate'].toString() as String,
      count: json['rating']['count'].toString() as String,
    );
  }
}
