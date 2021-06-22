import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/datas/cart_product.dart';
import 'package:flutter_virtual_store/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  CartModel(this.user);

  UserModel user;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<CartProduct> products = [];

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);
    firestore
        .collection('users')
        .doc(user.userCredential.user.uid)
        .collection('cart')
        .add(cartProduct.toMap())
        .then((DocumentReference doc) {
      cartProduct.cId = doc.id;
    });

    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    firestore
        .collection('users')
        .doc(user.userCredential.user.uid)
        .collection('cart')
        .doc(cartProduct.cId)
        .delete();

    products.remove(cartProduct);

    notifyListeners();
  }
}
