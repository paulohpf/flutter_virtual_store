import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (BuildContext context, Widget child, CartModel model) {
                final int p = model.products.length;

                return Text(
                  '${p ?? 0} ${p == 1 ? 'ITEM' : 'ITEMS'}',
                  style: const TextStyle(fontSize: 17),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
