import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // Products for Sale
  final List<Product> _shop = [
    Product(
      productName: "Smart Watch",
      productDescription:
          "Stay connected, healthy, and active with the Smart Watch. Features include fitness tracking, heart rate monitoring, and more.",
      productPrice: 399.99,
      productImagePath: "assets/Smartwatch.png",
    ),
    Product(
      productName: "Wireless Headphones",
      productDescription:
          "Experience high-quality sound with these black wireless headphones. Perfect for music lovers and audiophiles.",
      productPrice: 199.99,
      productImagePath: "assets/Headphones.png",
    ),
    Product(
      productName: "Android Smartphone",
      productDescription:
          "Stay connected with the latest Black Android Smartphone. Features a high-resolution camera, fast processor, and long battery life.",
      productPrice: 699.99,
      productImagePath: "assets/Smartphone.png",
    ),
    Product(
      productName: "Digital Camera",
      productDescription:
          "Capture stunning photos with the Black Canon EOS Rebel Series DSLR Camera. Ideal for both beginners and professional photographers.",
      productPrice: 499.99,
      productImagePath: "assets/Camera.png",
    ),
  ];

  // User Cart
  List<Product> _cart = [];

  // Get Product List
  List<Product> get shop => _shop;

  // Get User Cart
  List<Product> get cart => _cart;

  // Add Item to Cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // Remove Item from Cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
