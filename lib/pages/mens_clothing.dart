import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

import '../models/product.dart';
import '../utils/constants.dart';
import 'card.dart';

class MensClothing extends StatefulWidget {
  const MensClothing({super.key});

  @override
  State<MensClothing> createState() => _MensClothingState();
}

class _MensClothingState extends State<MensClothing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 9 / 18),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(child: ProductCard(product: products[index]));
        },
      ),
    );
  }
}
