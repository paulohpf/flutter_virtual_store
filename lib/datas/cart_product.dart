import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_virtual_store/datas/product_data.dart';

class CartProduct {
  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot snapshot) {
    cId = snapshot.id;
    category = snapshot.data()['category'] as String;
    pId = snapshot.data()['pId'] as String;
    quantity = snapshot.data()['quantity'] as int;
    size = snapshot.data()['quantity'] as String;
  }

  String cId;
  String pId;
  String category;
  int quantity;
  String size;

  ProductData productData;

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'pId': pId,
      'quantity': quantity,
      'size': size,
      // 'product': productData.toResumeMap(),
    } as Map<String, dynamic>;
  }
}
