import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:meragi_assignment/pages/mens_clothing.dart';
import 'package:meragi_assignment/utils/constants.dart';

import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  //final TabController _controller = TabController(length: 4, vsync: true);

  bool loading = true;

  void getPosts() async {
    print('Started fetch');
    Response res = await get(postsURL);
    print(res.statusCode);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Product> prods = body
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();

      setState(() {
        products = prods;
        loading = false;
      });
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Discover',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : MensClothing(),
      ),
    );
  }
}
