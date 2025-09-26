// This file defines the UI widget for a single product item (a "tile") in the grid.
// It displays the product's image, name, price, and an "add to cart" button.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/providers/cart_provider.dart';
import 'package:donut_app/Models/product_model.dart';

class DonutTile extends StatelessWidget {
  // Properties for the donut details. 
  final String donutFlavor;
  final double donutPrice;
  final dynamic donutColor;
  final String imageName;

  final double borderRadius = 12;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      required this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    // Logic to handle different color types
    final Color backgroundColor = donutColor is MaterialColor ? donutColor[50]! : donutColor;
    final Color priceBackgroundColor = donutColor is MaterialColor ? donutColor[100]! : donutColor;
    final Color priceTextColor = priceBackgroundColor.computeLuminance() > 0.5 
        ? Colors.grey[800]! 
        : Colors.white;
 

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: priceBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )),
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '\$${donutPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                     
                      color: priceTextColor, 
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 12),
              child: Image.asset(imageName),
            ),
            Text(
              donutFlavor,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Donuts',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      final product = Product(
                        name: donutFlavor,
                        price: donutPrice,
                        imagePath: imageName,
                      );
                      // Calls the add method from CartProvider to update the state.
                      Provider.of<CartProvider>(context, listen: false).add(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$donutFlavor added to cart!'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}