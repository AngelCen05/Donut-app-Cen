// This file defines the UI for the shopping cart screen.
// It displays a list of products in the cart, the total price,
// and allows users to remove items.

import 'package:donut_app/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/providers/cart_provider.dart';

//Widget for the shopping cart screen.
class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
     // Consumer widget rebuilds the UI when the cart state changes.
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My cart (${cart.items.length})'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          body: cart.items.isEmpty
              ? const Center(
                  child: Text(
                    'The cart is empty 🍩',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : Column(
                  children: [
                     // ListView.builder efficiently creates the list of cart items.
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final Product item = cart.items[index];
                          
                           // ListTile displays each cart item's details.
                          return ListTile(
                            leading: Image.asset(
                              item.imagePath,
                              width: 60,
                              height: 60,
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red[300]),
                              onPressed: () {
                                 //item details and remove button
                                cart.remove(item);
                              },
                            ),
                          );
                        },
                      ),
                    ),

                      // Displays the total price and a payment button.
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${cart.totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                               //Payment logic
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.brown,
                              ),
                              child: const Text(
                                'Pay now',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}