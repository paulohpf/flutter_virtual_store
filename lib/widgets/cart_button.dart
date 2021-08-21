import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/screens/cart_screen.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.shopping_cart, color: Colors.white),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) => CartScreen()));
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
