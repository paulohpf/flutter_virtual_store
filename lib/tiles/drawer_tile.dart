import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: Colors.black,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
