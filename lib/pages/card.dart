import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:18.0,bottom: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(18)
            ),
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      child: Image.network(widget.product.image!,
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.4,
                      fit: BoxFit.contain,))),
                ),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(widget.product.title!,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(widget.product.description!,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 8,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs. ${widget.product.price!} ",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text("⭐ ${widget.product.rate!}(${widget.product.count!})",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
