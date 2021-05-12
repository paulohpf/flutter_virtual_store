import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(this.snapshot);

  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data()['icon'] as String),
      ),
      title: Text(snapshot.data()['title'] as String),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => CategoryScreen(snapshot),
          ),
        );
      },
    );
  }
}
