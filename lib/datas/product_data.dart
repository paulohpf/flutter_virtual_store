import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.data()['title'] as String;
    description = snapshot.data()['description'] as String;
    price = snapshot.data()['price'] / 100 as double;
    images = snapshot.data()['images'] as List<dynamic>;
    sizes = snapshot.data()['sizes'] as List<dynamic>;
  }

  String category;
  String id;
  String title;
  String description;

  double price;

  List<dynamic> images;
  List<dynamic> sizes;
}
