// Defines the main screen of the application
// It includes the app bar, tab navigation for different product categories,
// and a shopping cart icon that navigates to the cart screen. 

import 'package:donut_app/Screens/shopping_cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/providers/cart_provider.dart';
import 'package:donut_app/Utils/Donut_Tab.dart';
import 'package:donut_app/Utils/coffee_tab.dart';
import 'package:donut_app/Utils/my_tab.dart';
import 'package:flutter/material.dart';

//Widget for main page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //tabs to display
  List<Widget> get myTabs => [
        //Donut Tab
        MyTab(
          iconPath: 'assets/icons/donuticon.png',
        ),
        //Coffe Tab
        MyTab(
          iconPath: 'assets/icons/coffeeicon.png',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    //Handles the state of tabs
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  //Open drawer
                }),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey[800],
                    size: 36,
                  ),
                  onPressed: () {
                    //account button
                  }),
            ),
            // NEW: Shopping Cart Icon
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              // Use a Consumer to listen for changes in the cart
              child: Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return IconButton(
                    icon: Badge(
                      label: Text(cart.items.length.toString()),
                      isLabelVisible: cart.items.isNotEmpty,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey[800],
                        size: 36,
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the shopping cart screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(children: [
          //Menu Text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Text(
                  'Donuts & Coffee',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          //Tab bar
          TabBar(tabs: myTabs),
          //tab bar view
          Expanded(
              child: TabBarView(children: [
            //Donut Page
            DonutTab(),

            //Coffe Page
            CoffeeTab(),
          ]))
        ]),
      ),
    );
  }
}