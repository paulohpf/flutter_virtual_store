import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/screens/category_tab.dart';
import 'package:flutter_virtual_store/tabs/home_tab.dart';
import 'package:flutter_virtual_store/widgets/cart_button.dart';
import 'package:flutter_virtual_store/widgets/custom-drawer.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CategoryTab(),
          floatingActionButton: CartButton(),
        ),
        Container(color: Colors.blue),
        Container(color: Colors.green)
      ],
    );
  }
}
