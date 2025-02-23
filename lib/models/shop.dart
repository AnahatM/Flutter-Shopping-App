import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // Products for Sale
  final List<Product> _shop = [
    Product(
      productName: "Product 1",
      productDescription:
          "This is a placeholder description for Product 1. It includes key features and benefits to attract customers.",
      productPrice: 100.0,
      // productImagePath: "assets/images/product1.jpg",
    ),
    Product(
      productName: "Product 2",
      productDescription: "Description 2",
      productPrice: 100.0,
      // productImagePath: "assets/images/product1.jpg",
    ),
    Product(
      productName: "Product 3",
      productDescription: "Description 1",
      productPrice: 100.0,
      // productImagePath: "assets/images/product1.jpg",
    ),
    Product(
      productName: "Product 4",
      productDescription: "Description 1",
      productPrice: 100.0,
      // productImagePath: "assets/images/product1.jpg",
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
