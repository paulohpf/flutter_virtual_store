import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/datas/cart_product.dart';
import 'package:flutter_virtual_store/datas/product_data.dart';
import 'package:flutter_virtual_store/models/cart_model.dart';
import 'package:flutter_virtual_store/models/user_model.dart';
import 'package:flutter_virtual_store/screens/cart_screen.dart';

import 'login_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(this.product);

  final ProductData product;

  @override
  _ProdutScreenState createState() => _ProdutScreenState();
}

class _ProdutScreenState extends State<ProductScreen> {
  ProductData product;
  String size;

  @override
  Widget build(BuildContext context) {
    product = widget.product;

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((dynamic url) {
                return NetworkImage(url as String);
              }).toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Tamanho',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes
                        .map(
                          (dynamic s) => GestureDetector(
                            onTap: () {
                              setState(() {
                                size = s as String;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                border: Border.all(
                                  color: s == size
                                      ? primaryColor
                                      : Colors.grey[500],
                                  width: 2,
                                ),
                              ),
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(s as String),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: size != null
                        ? () {
                            if (UserModel.of(context).isLoggedIn()) {
                              final CartProduct cartProduct = CartProduct();
                              cartProduct.size = size;
                              cartProduct.quantity = 1;
                              cartProduct.pId = product.id;
                              cartProduct.category = product.category;

                              CartModel.of(context).addCartItem(cartProduct);

                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      CartScreen(),
                                ),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                              );
                            }
                          }
                        : null,
                    child: Text(
                      UserModel.of(context).isLoggedIn()
                          ? 'Adicionar ao carrinho'
                          : 'Entre para comprar',
                      style: const TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.white),
                        primary: primaryColor),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Descrição',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
