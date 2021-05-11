import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/tiles/category_tile.dart';

class CategoryTab extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: firestore.collection('products').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<Widget> dividedTiles = ListTile.divideTiles(
          tiles: snapshot.data.docs
              .map((QueryDocumentSnapshot doc) => CategoryTile(doc))
              .toList(),
          color: Colors.grey[500],
        ).toList();

        return ListView(
          children: dividedTiles,
        );
      },
    );
  }
}
