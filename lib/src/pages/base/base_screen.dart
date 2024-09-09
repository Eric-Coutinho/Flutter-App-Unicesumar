import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          currentIndex: currentIndex,
          backgroundColor: CustomColors.customizedAppColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(100),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ]),
    );
  }
}
