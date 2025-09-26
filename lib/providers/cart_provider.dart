//Cart provider, it manages the cart state and allows
//puting items on it or removing them.

import 'package:donut_app/Models/product_model.dart';
import 'package:flutter/material.dart';
// Imports the produc model

class CartProvider extends ChangeNotifier {
  //List of the products
  final List<Product> _items = [];

  // Getter para acceder a la lista de productos
  List<Product> get items => _items;

  // Getter para calcular el precio total
  double get totalPrice {
    double total = 0.0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  // Function for adding products to the cart
  void add(Product product) {
    _items.add(product);
    //Updates the widgets
    notifyListeners();
  }

  // Removes a product from the cart and notifies listeners.
  void remove(Product product) {
    _items.remove(product);
    // Notifica a los widgets que escuchan para que se actualicen
    notifyListeners();
  }

   // Clears all products from the cart and notifies listeners.
  void clear() {
    _items.clear();
    notifyListeners();
  }
}