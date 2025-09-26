// Defines the data structure for a generic Product.
// This class is used to represent any item that can be sold,
// such as donuts or coffee, allowing them to be in the same cart.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/providers/cart_provider.dart';
import 'package:donut_app/Models/product_model.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeFlavor;
  final double coffeePrice;
  final dynamic coffeeColor;
  final String imageName;

  final double borderRadius = 12;

  const CoffeeTile(
      {super.key,
      required this.coffeeFlavor,
      required this.coffeePrice,
      required this.coffeeColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
 
    final Color backgroundColor = coffeeColor is MaterialColor ? coffeeColor[50]! : coffeeColor;
    final Color priceBackgroundColor = coffeeColor is MaterialColor ? coffeeColor[100]! : coffeeColor;
    

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
                    '\$${coffeePrice.toStringAsFixed(2)}',
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
              coffeeFlavor,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Coffee',
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
                        name: coffeeFlavor,
                        price: coffeePrice,
                        imagePath: imageName,
                      );
                      Provider.of<CartProvider>(context, listen: false).add(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$coffeeFlavor added to cart!'),
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