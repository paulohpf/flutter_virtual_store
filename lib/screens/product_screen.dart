import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(this.product);

  final ProductData product;

  @override
  _ProdutScreenState createState() => _ProdutScreenState();
}

class _ProdutScreenState extends State<ProductScreen> {
  ProductData product;

  @override
  Widget build(BuildContext context) {
    product = widget.product;

    return Container();
  }
}
