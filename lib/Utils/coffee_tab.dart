// This file defines the content for the "coffe" tab.
// It holds a list of coffe data and displays them in a GridView using coffeTile widgets.

import 'package:flutter/material.dart';
import 'package:donut_app/Utils/coffee_tile.dart';

class CoffeeTab extends StatelessWidget {
  // List of Coffee
  final List coffeeOnSale = [
    // [CoffeeFlavor, CoffeePrice, CoffeeColor, imageName]
    ["Americano", 2.0, const Color.fromARGB(255, 52, 31, 129), "assets/images/Americancoffee.png"],
    ["Latte", 2.0, const Color.fromARGB(255, 33, 177, 45), "assets/images/Latte.png"],
    ["Chocolate", 2.0, const Color.fromARGB(255, 190, 26, 149), "assets/images/Chocolate.png"],
  ];

  CoffeeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: coffeeOnSale.length,
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return CoffeeTile(
            coffeeFlavor: coffeeOnSale[index][0],
            coffeePrice: coffeeOnSale[index][1],
            coffeeColor: coffeeOnSale[index][2],
            imageName: coffeeOnSale[index][3],
          );
        });
  }
}