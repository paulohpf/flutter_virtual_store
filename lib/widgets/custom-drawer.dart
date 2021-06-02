import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/screens/login_screen.dart';
import 'package:flutter_virtual_store/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(this.pageController);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                      top: 8,
                      left: 0,
                      child: Text(
                        'Flutter\'s \nVirtual Store',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Olá,',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Entre ou cadastre-se >',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          LoginScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(
                  Icons.location_on, 'Encontre uma loja', pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, 'Meus pedidos', pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}
