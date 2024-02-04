import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/Cart.dart';
import 'package:shoes_shopping_app/home_product.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int CurrentPage = 0;

  List<Widget>pages  = [
    homeproduct(),
   CartItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: CurrentPage,
            onTap: (value) {
              setState(() {
                CurrentPage = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),

              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '')

            ]),
        backgroundColor: Colors.white,
        body: CurrentPage == 0
            ?homeproduct():
            CartItem(),


    );
  }
}
