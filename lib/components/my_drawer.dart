import 'package:flutter/material.dart';
import 'package:minimalist_ecommerce/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column for Items aligned to top of drawer
          Column(
            children: [
              // Drawer Header: Logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              // Shop Tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // Cart Tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // Pop Drawer First
                  Navigator.pop(context);
                  // Navigate to Cart Page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // Exit Shop Tile aligned to bottom of drawer
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap:
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/intro_page',
                    (route) => false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
