//Model for all the products sold, allowing them to be added to the cart and showing their name and price

class Product {
  final String name;
  final double price;
  final String imagePath;

  // Constructor for the Product class.

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}