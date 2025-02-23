import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/components/my_drawer.dart';
import 'package:minimalist_ecommerce/components/my_product_tile.dart';
import 'package:minimalist_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get Product List from Shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: Text("Shop"),
        actions: [
          // Cart Icon Button
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {
              // Navigate to Cart Page
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 10),

          // Shop Subtitle
          Center(
            child: Text(
              "Pick from a selection of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // Product List
          SizedBox(
            height: 600,
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                // Get each individual product
                final product = products[index];

                // Return Product Tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
