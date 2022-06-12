import 'package:flutter/material.dart';

import 'package:training/intro/products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  const ProductManager(this.startingProduct, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // implement createState
    return _ProductMangerState();
  } 
}

class _ProductMangerState extends State<ProductManager> {
  final List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(10.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _products.add("Advanced Siblings Tester");
                  });
                },
                child: const Text("Add Product"))),
        Products(_products)
      ],
    );
  }
}
