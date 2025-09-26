// This file defines the content for the "Donuts" tab.
// It holds a list of donut data and displays them in a GridView using DonutTile widgets.
import 'package:donut_app/Utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  // List of donuts
  final List donutsOnSale = [
    // [donutFlavor, donutPrice, donutColor, imageName]
    ["Strawberry", 1.0, Colors.pinkAccent, "assets/images/donut.png"],
    ["Chocolate", 1.5, const Color.fromARGB(255, 89, 57, 45), "assets/images/donut2.png"],
    ["Chocolate", 1.0, Colors.brown, "assets/images/donut3.png"],
    ["Vanilla", 1.5, Colors.yellow, "assets/images/donut4.png"],
    ["Caramel", 2.0, Colors.orangeAccent, "assets/images/donut5.png"],
    ["Mint-Choco", 2.0, Colors.cyanAccent, "assets/images/donut6.png"],
    ["Glazed", 1.5, const Color.fromARGB(237, 245, 218, 199), "assets/images/donut7.png"],
    ["Cinnamon", 1.0, const Color.fromARGB(255, 173, 117, 95), "assets/images/donut8.png"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          );
        });
  }
}